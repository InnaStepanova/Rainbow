//
//  CurrentGameModel.swift
//  Rainbow
//
//  Created by Лаванда on 17.11.2023.
//

import Foundation

struct CurrentGameModel: Codable {
    let speed: Double
    let boost: Double
    let longGameTime: Double
    let currentGameTime: Double
    let isBackgroundForView: Bool
}
