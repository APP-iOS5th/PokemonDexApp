//
//  PokemonHomeUseCaseTest.swift
//  Team0418PokemonTests
//
//  Created by jinwoong Kim on 5/2/24.
//

import XCTest
@testable import Team0418Pokemon

final class PokemonHomeUseCaseTest: XCTestCase {
    var apiService: (any HomeUseCase)!

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
        /// Since `pokemondetail` json file is too large,
        /// we cannot make data variable from it.
        /// Instead this approach, I decide to use real network data.
        let (pokemon4, _) = try await URLSession.shared.data(from: URL(string: "https://pokeapi.co/api/v2/pokemon/4")!)
        
        MockURLSessionProtocol.loadingHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            return (response!, pokemon4)
        }
        
        // result
        let networkingResult = await apiService.request()
        
        XCTAssert(networkingResult.count == 9)
    }
}
