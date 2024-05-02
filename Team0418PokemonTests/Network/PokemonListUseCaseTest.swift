//
//  PokemonListUseCaseTest.swift
//  Team0418PokemonTests
//
//  Created by jinwoong Kim on 5/2/24.
//

import XCTest
@testable import Team0418Pokemon

final class PokemonListUseCaseTest: XCTestCase {
    var apiService: (any ListUseCase)!

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        apiService = PokemonAPIService(session: urlSession)
    }
    
    func test_request() async throws {
        guard let path = Bundle(for: Team0418PokemonTests.self).url(forResource: "pokemonlist", withExtension: "json"),
              let pokemonListData = try? Data(contentsOf: path) else {
            XCTFail("Failed to get the static Pokemon List File.")
            return
        }
        /// Since this json file is too large,
        /// we cannot make data variable.
        /// Instead this approach, I decide to use real network data.
//        guard let path = Bundle(for: Team0418PokemonTests.self).url(forResource: "pokemondetail", withExtension: "json"),
//              let pokemonDetailData = try? Data(contentsOf: path) else {
//            XCTFail("Failed to get the static Pokemon List File.")
//            return
//        }
        let (pokemonDetailData, _) = try await URLSession.shared.data(from: URL(string: "https://pokeapi.co/api/v2/pokemon/1")!)
        
        let offset = 0
        let limit = 151
        let urlString = "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)"
        
        MockURLSessionProtocol.loadingHandler = { request in
            if request.description == urlString {
                let response = HTTPURLResponse(url: URL(string: urlString)!, statusCode: 200, httpVersion: nil, headerFields: nil)
                return (response!, pokemonListData)
            } else {
                let response = HTTPURLResponse(url: URL(string: urlString)!, statusCode: 200, httpVersion: nil, headerFields: nil)
                return (response!, pokemonDetailData)
            }
        }
        
        
        // result
        let networkingResult = await apiService.request(with: 0, 151)
        
        XCTAssert(networkingResult.count == limit - offset)
    }

    override func tearDownWithError() throws {
        apiService = nil
    }
}
