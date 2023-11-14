//
//  GameScreenViewModel.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

class GameScreenViewModel: ObservableObject {

    @Published var elementColor: Color = .red
    private var timer: Timer?

    var time: Double {
        1
    }

    let colorSet: [CustomColors] = CustomColors.allCases

    var labelText: String {
        "привет"
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { _ in
            self.elementColor = self.randomColor(colors: self.colorSet)
        }
    }

    // TODO: реализовать паузу
    func pauseTimer() {
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func randomColor(colors: [CustomColors]) -> Color {
        colors.randomElement()?.color ?? .customAlmond
    }
}
