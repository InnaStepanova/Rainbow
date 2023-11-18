//
//  SettingsModel.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import Foundation

struct SettingsModel: Codable {
    var gameDuration: Double = 2.0
   var speedOfChangingWords: Double = 5.0
   var isBackgroundForView: Bool = true
   var isChangeTextColor: Bool = false
}
