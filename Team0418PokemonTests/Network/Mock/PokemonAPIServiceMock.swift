//
//  PokemonAPIServiceMock.swift
//  Team0418PokemonTests
//
//  Created by jinwoong Kim on 5/1/24.
//

import Foundation
@testable import Team0418Pokemon

final class PokemonAPIServiceMock: APIService {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
}
