//
//  Color+Ext.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import SwiftUI

enum CustomColors: String, CaseIterable {
    case customAlmond
    case customBlue
    case customBrown
    case customGray
    case customGreen
    case customLavender
    case customLemon
    case customOrange
    case customPeach
    case customPink
    case customPurple
    case customYellow

    var color: Color {
        switch self {
        case .customAlmond:
            return Color("customAlmond")
        case .customBlue:
            return Color("customBlue")
        case .customBrown:
            return Color("customBrown")
        case .customGray:
            return Color("customGray")
        case .customGreen:
            return Color("customGreen")
        case .customLavender:
            return Color("customLavender")
        case .customLemon:
            return Color("customLemon")
        case .customOrange:
            return Color("customOrange")
        case .customPeach:
            return Color("customPeach")
        case .customPink:
            return Color("customPink")
        case .customPurple:
            return Color("customPurple")
        case .customYellow:
            return Color("customYellow")
        }
    }
}

extension Color {
    static var customAlmond: Color {
        return Color("customAlmond")
    }

    static var customBlue: Color {
        return Color("customBlue")
    }
    
    static var customBrown: Color {
        return Color("customBrown")
    }
    
    static var customGray: Color {
        return Color("customGray")
    }
    
    static var customGreen: Color {
        return Color("customGreen")
    }
    
    static var customLavender: Color {
        return Color("customLavender")
    }
    
    static var customLemon: Color {
        return Color("customLemon")
    }
    
    static var customOrange: Color {
        return Color("customOrange")
    }
    
    static var customPeach: Color {
        return Color("customPeach")
    }
    
    static var customPink: Color {
        return Color("customPink")
    }
    
    static var customPurple: Color {
        return Color("customPurple")
    }
    
    static var customYellow: Color {
        return Color("customYellow")
    }
}
