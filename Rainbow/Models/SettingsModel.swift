//
//  SettingsModel.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import Foundation

struct SettingsModel: Codable {
    let gameDuration: Double
    let speedOfChangingWords: Double
    let isBackgroundForView: Bool
    let isChangeTextColor: Bool
}
