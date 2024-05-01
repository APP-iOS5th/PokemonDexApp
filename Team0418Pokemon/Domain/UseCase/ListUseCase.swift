//
//  ListUseCase.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

protocol ListUseCase {
    func request(with offset: Int, _ limit: Int) async -> [Pokemon]
}
