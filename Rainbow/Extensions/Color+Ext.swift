//
//  Color+Ext.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import SwiftUI

enum CustomColors: String, CaseIterable {
    case cellBackground
    case customAlmond
    case customBlue
    case customBrown
    case customFuxia
    case customGray
    case customGreen
    case customLavender
    case customLemon
    case customLightGreen
    case customOrange
    case customPeach
    case customPink
    case customPurple
    case customRed
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
        case .customLightGreen:
            return Color("customLightGreen")
        case .customOrange:
            return Color("customOrange")
        case .customPeach:
            return Color("customPeach")
        case .customPink:
            return Color("customPink")
        case .customPurple:
            return Color("customPurple")
        case .customRed:
            return Color("customRed")
        case .customYellow:
            return Color("customYellow")
        case .customFuxia:
            return Color("customFuxia")
        case .cellBackground:
            return Color("cellBackground")
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
    
    static var customLightGreen: Color {
        return Color("customLightGreen")
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
    
    static var customRed: Color {
        return Color("customRed")
    }
    
    static var customFuxia: Color {
        return Color("customFuxia")
    }
    
    static var cellBackground: Color {
        return Color("cellBackground")
    }
}
