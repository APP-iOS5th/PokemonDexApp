//
//  HomeUseCase.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

protocol HomeUseCase {
    func request() async -> [Pokemon]
}
