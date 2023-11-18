//
//  StatisticModel.swift
//  Rainbow
//
//  Created by Лаванда on 14.11.2023.
//

import Foundation

struct StatisticModel: Codable {
    let number: Int
    let speed: Int
    let time: Int
    // убрать, если не реализуем функционал
    let qtyQuestions: Int
    let qtyRightAnswers: Int
}
