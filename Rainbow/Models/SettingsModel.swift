//
//  SettingsModel.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import Foundation

struct SettingsModel: Codable {
    let minutesSlider: Double
    let speedOfChangingWords: Double
    let backgroundForText: Bool
}
