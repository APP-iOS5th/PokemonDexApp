//
//  Sequence+.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 5/2/24.
//

import Foundation

extension Sequence {
    /// Higher-order function
    /// with swift concurrency
    /// by [sundell](https://www.swiftbysundell.com/articles/async-and-concurrent-forEach-and-map/)
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()
        
        for element in self {
            try await values.append(transform(element))
        }
        
        return values
    }
    
    func cocurrentMap<T>(
        _ transform: @escaping (Element) async throws -> T
    ) async rethrows -> [T] {
        let tasks = map { element in
            Task {
                try await transform(element)
            }
        }
        
        return try await tasks.asyncMap { task in
            try await task.value
        }
    }
}
