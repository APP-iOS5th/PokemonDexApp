//
//  TabViewModel.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

enum TabbedItems : Int, CaseIterable {
    case sortedOne = 0
    case searchThing = 1
    case theOtherThings = 2
    
    var title: String {
        switch self {
        case .sortedOne:
            return "HOME"
        case .searchThing:
            return "SEARCH"
        case .theOtherThings:
            return "EXTRA"
        }
    }
    
    var iconName: String {
        switch self {
        case .sortedOne:
            return "TapViewIcon_Home2"
        case .searchThing:
            return "TapViewIcon_Search2"
        case .theOtherThings:
            return "TapViewIcon_EXTRA"
        }
    }
}
