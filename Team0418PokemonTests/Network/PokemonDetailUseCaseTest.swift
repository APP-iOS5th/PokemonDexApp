//
//  PokemonDetailUseCaseTest.swift
//  Team0418PokemonTests
//
//  Created by jinwoong Kim on 5/2/24.
//

import XCTest
@testable import Team0418Pokemon

final class PokemonDetailUseCaseTest: XCTestCase {
    var apiService: (any DetailUseCase)!
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        apiService = PokemonAPIService(session: urlSession)
    }

    override func tearDownWithError() throws {
        apiService = nil
    }

    func test_request() async throws {
        guard let path = Bundle(for: Team0418PokemonTests.self).url(forResource: "poekmonspecies", withExtension: "json"),
              let pokemonSpeciesData = try? Data(contentsOf: path) else {
            XCTFail("Failed to get the static Pokemon List File.")
            return
        }
        /// Since `pokemondetail` json file is too large,
        /// we cannot make data variable from it.
        /// Instead this approach, I decide to use real network data.
        let (pokemonDetailData, _) = try await URLSession.shared.data(from: URL(string: "https://pokeapi.co/api/v2/pokemon/1")!)
        
        let pokemonDetailEndpointUrl = "https://pokeapi.co/api/v2/pokemon/1/"
        let pokemonSpeciesEndpointUrl = "https://pokeapi.co/api/v2/pokemon-species/1/"
        
        
        MockURLSessionProtocol.loadingHandler = { request in
            if request.description == pokemonDetailEndpointUrl {
                let response = HTTPURLResponse(
                    url: request.url!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
                
                print(request.description)
                return (response!, pokemonDetailData)
            } else {
                let response = HTTPURLResponse(
                    url: request.url!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
                
                print(request.description)
                return (response!, pokemonSpeciesData)
            }
        }
        
        // result
        let networkingResult = await apiService.request(with: 1)
        
        XCTAssert(networkingResult.id == 1)
        XCTAssert(networkingResult.name == "bulbasaur")
    }
}
