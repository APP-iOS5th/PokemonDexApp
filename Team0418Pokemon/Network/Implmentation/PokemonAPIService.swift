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
            return try await fetchFirePokemons()
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
