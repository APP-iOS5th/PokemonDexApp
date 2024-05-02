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
