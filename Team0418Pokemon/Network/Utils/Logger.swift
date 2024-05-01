//
//  Logger.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 5/1/24.
//

import Foundation

struct Logger {
    enum Level: Int, CustomStringConvertible {
        case error
        case warn
        case debug
        
        var description: String {
            switch self {
                case .error:
                    return "‼️ ERROR:"
                case .warn:
                    return "⚠️ WARNING:"
                case .debug:
                    return "⚒️ DEBUG:"
            }
        }
    }
    
    static let errorLog = log(level: .error)
    static let debugLog = log(level: .debug)
    static let warningLog = log(level: .warn)
    
    static func log(
        level: Level
    ) -> (String) -> ((String) -> ()) {
        return { name in
            return { message in
                print("\(level) \(name)\n\(message)")
            }
        }
    }
}
