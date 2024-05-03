//
//  PokemonAPIService.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

final class PokemonAPIService: APIService {
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(with urlType: PokemonAPIUrl) async throws -> T {
        let endpoint: Endpoint<T> = Endpoint(urlString: urlType.apiUrl)
        let data = try await request(with: endpoint)
        
        return data
    }
}

extension PokemonAPIService: ListUseCase {
    func request(with offset: Int, _ limit: Int) async -> [Pokemon] {
        do {
            let rangedPokemonData: PokemonListDTO = try await request(with: .list(offset: offset, limit: limit))
            return try await rangedPokemonData.results.concurrentMap(mapping(_:))
        } catch let error as HttpError {
            Logger.errorLog("HttpError")(error.localizedDescription)
        } catch {
            Logger.errorLog("OtherError")(error.localizedDescription)
        }
        
        return []
    }
    
    private func mapping(_ item: PokemonListItem) async throws -> Pokemon {
        let result: PokemonDetailDTO = try await request(with: .rawUrl(item.url))
        return Pokemon(
            id: result.id,
            name: result.name,
            imageUrlString: result.sprites.frontDefault
        )
    }
}

extension PokemonAPIService: HomeUseCase {
    func request() async -> [Pokemon] {
        do {
            return try await fetchFirePokemons().sorted { $0.id < $1.id }
        } catch {
            Logger.errorLog("Other Error")(error.localizedDescription)
        }
        
        return []
    }
    
    private func fetchFirePokemons() async throws -> [Pokemon] {
        try await withThrowingTaskGroup(
            of: PokemonDetailDTO.self,
            returning: [Pokemon].self
        ) { group in
            let dexIds = [4, 155, 255, 390, 498, 653, 725, 813, 909]
            for id in dexIds {
                group.addTask { try await self.request(with: .detail(id)) }
            }
            
            var pokemons: [Pokemon] = []
            for try await result in group {
                let pokemon = Pokemon(
                    id: result.id,
                    name: result.name,
                    imageUrlString: result.sprites.frontDefault
                )
                pokemons.append(pokemon)
            }
            
            return pokemons
        }
    }
}

extension PokemonAPIService: DetailUseCase {
    func request(with pokemonId: Int) async -> PokemonDetail {
        do {
            async let speciesData: PokemonSpeciesDTO = try request(with: .species(pokemonId))
            async let detailData: PokemonDetailDTO = try request(with: .detail(pokemonId))
            
            let (fetchedSpeciesData, fetchedDetailData) = try await (speciesData, detailData)
            let composedPokemonStat = composePokemonStat(with: fetchedDetailData.stats)
            let pokemonStat = PokemonStat(
                hp: composedPokemonStat["hp" ,default: 0],
                attack: composedPokemonStat["attack" ,default: 0],
                defense: composedPokemonStat["defense" ,default: 0],
                specialAttack: composedPokemonStat["special-attack" ,default: 0],
                specialDefense: composedPokemonStat["special-defense" ,default: 0],
                speed: composedPokemonStat["speed" ,default: 0]
            )
            
            return PokemonDetail(
                id: fetchedDetailData.id,
                type: PokemonType(
                    rawValue: fetchedDetailData
                        .types[0]
                        .type
                        .name
                ) ?? .water,
                name: fetchedDetailData.name,
                imageUrlString: fetchedDetailData.sprites.frontDefault,
                stat: pokemonStat,
                genus: fetchedSpeciesData.genera[0].genus
            )
        } catch {
            Logger.errorLog("Ohter Error")(error.localizedDescription)
        }
        Logger.warningLog("This Result is weird.")("Do not use this data which not contain url string.")
        return PokemonDetail(
            id: -1,
            type: .water,
            name: "",
            imageUrlString: "",
            stat: PokemonStat(
                hp: 0,
                attack: 0,
                defense: 0,
                specialAttack: 0,
                specialDefense: 0,
                speed: 0
            ),
            genus: ""
        )
    }
    
    private func composePokemonStat(
        with pokemonStats: [PokemonStatsDTO]
    ) -> [String: Int] {
        pokemonStats.reduce(into: [:]) { partialResult, pokemonDTO in
            partialResult[pokemonDTO.stat.name, default: 0] = pokemonDTO.baseStat
        }
    }
}

extension PokemonAPIService: SearchUseCase {
    func request(
        with pokemonName: String,
        _ pokemonType: PokemonType
    ) async -> [SearchedPokemon] {
        do {
            print("‼️ start")
            let allPokemons: PokemonListDTO = try await request(
                with: .list(offset: 0, limit: 2000)
            )
            return try await allPokemons
                .results
                .filter {
                    $0.name.contains(pokemonName)
                }
                .asyncMap(searchPokemon(_:))
                .filter { pokemonDetail in
                    pokemonDetail.types.contains { outer in
                        switch pokemonType {
                            case .all:
                                return true
                            default:
                                return outer.type.name == pokemonType.rawValue
                        }
                    }
                }
                .map { $0.toSearchedPokemon() }
        } catch {
            Logger.errorLog("Other Error")(error.localizedDescription)
        }
        
        return []
    }
    
    private func searchPokemon(
        _ pokemon: PokemonListItem
    ) async throws -> PokemonDetailDTO {
        try await request(
            with: .detailString(pokemon.name)
        )
    }
}
