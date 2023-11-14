//
//  GameEngineViewModel.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

class GameEngineViewModel: ObservableObject {

    // MARK: - Model from settings
    let model = LocalStorageService.shared.loadSettings(settingsName: Keys.settings.rawValue)

    @Published var elementColor: Color = .red // Сюда прилетает рандомный цвет
    @Published var viewPosition: CGFloat = CGFloat.random(in: -100...100) // Сюда прилетает рандомная позиция
    @Published var timerInterval: TimeInterval = 5.0 // Начальное время засэтапить с настроек
    private var timer: DispatchSourceTimer?
    
    lazy var colorSet: [CustomColors] = model!.backgroundForText ? CustomColors.allCases : [CustomColors.customGreen]
    var labelText: String {
        "привет"
    }
    var time: Double {
        1
    }
    var applicationBackground: Color {
        Color.gray
    }

    func startTimer() {
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now() + timerInterval, repeating: timerInterval)
        timer?.setEventHandler {
            DispatchQueue.main.async {
                self.elementColor = self.randomColor(colors: self.colorSet)
                self.viewPosition = CGFloat.random(in: -100...100)
            }
        }
        timer?.resume()
    }

    func pauseTimer() {
        timer?.suspend()
    }

    func stopTimer() {
        timer?.cancel()
    }

    func increaseTimerInterval(withTime: Double) {
        timerInterval -= withTime
        print("GEBUGGG: now time is: \(timerInterval)")
        stopTimer()
        startTimer()
    }

    func randomColor(colors: [CustomColors]) -> Color {
        colors.randomElement()?.color ?? .customAlmond
    }
}




//    func startTimerWith() {
//
//
//        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { time in
//            self.elementColor = self.randomColor(colors: self.colorSet)
//            self.viewPosition = CGFloat.random(in: -100...100)
//            print("DEBUGG: time is - \(time)")
//        }
//    }


//        timer?.invalidate()
//        timer = nil
