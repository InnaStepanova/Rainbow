//
//  GameScreenViewModel.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

class GameScreenViewModel: ObservableObject {

    // Передать время из настроек
    var time: Double {
       2
    }

    private var timer: Timer?

    let colorSet: [UIColor] = [
        .red,
        .blue,
        .green,
        .orange,
        .purple,
        .yellow,
        .gray,
        .black,
        .white,
    ]

    @Published var elementColor: UIColor = .red

    var labelText: String {
       "привет"
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { _ in
            self.elementColor = self.createRandomLabelColor(colors: self.colorSet)
        }
    }

    // TODO: реализовать паузу
    func pauseTimer() {

    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func createRandomLabelColor(colors: [UIColor]) -> UIColor {
        colors.randomElement() ?? .black
    }

}
