//
//  HttpError.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

enum HttpError: Error {
    case invalidRequest
    case badResponse
    case errorWith(code: Int, data: Data)
    case invalidURL
}
