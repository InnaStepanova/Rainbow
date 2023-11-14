//
//  Color-Theme.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var mainBackground: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.2)
    }
    
    static var customRed: Color {
        Color(red: 222 / 255, green: 34 / 255, blue: 34 / 255, opacity: 1)
    }
    
    static var customBlue: Color {
        Color(red: 47 / 255, green: 134 / 255, blue: 183 / 255, opacity: 1)
    }
    
    static var customGreen: Color {
        Color(red: 48 / 255, green: 167 / 255, blue: 74 / 255, opacity: 1)
    }
    
    static var customPurple: Color {
        Color(red: 110 / 255, green: 9 / 255, blue: 112 / 255, opacity: 1)
    }
}
