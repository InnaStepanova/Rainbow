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

    @Published var tagViewBackgroundColor: Color?                                   // Рандомный цвет вью
    @Published var labelText: String = ""                                           // Текст для лейбла
    @Published var tagViewTextColor: Color = .red                                   // Цвет текста лейбла тэг вью
    @Published var tagViewXPosition: CGFloat = CGFloat.random(in: -100...100)       // Рандомная позиция X
    @Published var tagViewYPosition: CGFloat = CGFloat.random(in: -100...100)       // Рандомная позиция Y
    @Published var changeViewTimerInterval: TimeInterval = 5.0                      // Ускорение игры по нажатию на кнопку
    @Published var roundDuration: TimeInterval = 300                                // Время раунда
    
    // MARK: list of statistical models, with game results.
    @Published var statistics: [StatisticModel] = []

    let applicationBackground: Color = Color.gray
    let colorsForTagBackground: [CustomColors] = CustomColors.allCases
    let textsForLabel: [TextForTagView] = TextForTagView.allCases
    var screenBounds: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    private var timer: DispatchSourceTimer?
    private var raundTimer: Timer?
    private var timerToggle: Bool = false
    private var isRaundTimerPaused = false

    var formattedGameTime: String {
        let minutes = Int(roundDuration) / 60
        let seconds = Int(roundDuration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var getRoundStatistic: StatisticModel {
        let number = statistics.count + 1
        let speed = changeViewTimerInterval
        let time = model?.gameDuration ?? 300
        let numbersOfQuetions = Int(time / changeViewTimerInterval)
        let numbersOfRightAnswers = numbersOfQuetions
        
        return StatisticModel(
            number: number, 
            speed: speed,
            time: time,
            qtyQuestions: numbersOfQuetions,
            qtyRightAnswers: numbersOfRightAnswers
        )
    }

    func initial() {
        labelText = textsForLabel.randomElement()?.rawValue ?? ""
        tagViewBackgroundColor = isNeedShowTagBackground() ? randomColorGenerator(colors: colorsForTagBackground) : .clear
        tagViewTextColor = isNeedChangeTextColor() ? randomColorGenerator(colors: colorsForTagBackground) : .white
        roundDuration = model?.gameDuration ?? 300
    }

    func startGameEngineTimer() {
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now() + changeViewTimerInterval, repeating: changeViewTimerInterval)
        timer?.setEventHandler {
            DispatchQueue.main.async {
                self.labelText = self.textsForLabel.randomElement()?.rawValue ?? ""
                self.tagViewBackgroundColor = self.isNeedShowTagBackground() ? self.randomColorGenerator(colors: self.colorsForTagBackground) : .clear
                self.tagViewXPosition = CGFloat.random(in: -self.screenBounds.width/4 ... self.screenBounds.width/4)
                self.tagViewYPosition = CGFloat.random(in: -self.screenBounds.height/3 ... self.screenBounds.height/3)
            }
        }
        timer?.resume()
    }

    func startGameDurationTimer() {
        raundTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateRaundTimer), userInfo: nil, repeats: true)
    }

    @objc func updateRaundTimer() {
        if !isRaundTimerPaused {
            roundDuration -= 1.0
            if roundDuration <= 0 {
                raundTimer?.invalidate()
            }
        }
    }

    func pauseTimer() {
        timerToggle.toggle()
        timerToggle ? timer?.suspend() : timer?.resume()
        isRaundTimerPaused = timerToggle
    }

    func stopTimer() {
        timer?.cancel()
        raundTimer?.invalidate()
        
        // call save statistics method
        let roundStatistics = getRoundStatistic
        updateStatistics(newStatistic: roundStatistics)
    }

    func changeTimerInterval() {
        guard (changeViewTimerInterval - changeViewTimerInterval / 2) > 0 else { return }
        changeViewTimerInterval -= changeViewTimerInterval / 2
        print("changeViewTimerInterval")
        startGameEngineTimer()
    }

    private func randomColorGenerator(colors: [CustomColors]) -> Color {
        colors.randomElement()?.color ?? .customAlmond
    }

    private func isNeedShowTagBackground()-> Bool {
        guard let model else { return false }
        return model.isBackgroundForView ? true : false
    }

    private func isNeedChangeTextColor()-> Bool {
        guard let model else { return false }
        return model.isChangeTextColor ? true : false
    }
    
    // MARK: - Logic for loading statistics from UserDefaults
    func loadStatistics() {
        statistics = LocalStorageService.shared.loadStatistics(key: Keys.statistics.rawValue) ?? []
    }
    
    func updateStatistics(newStatistic: StatisticModel) {
        statistics.append(newStatistic)
        LocalStorageService.shared.saveStatistics(statistics, key: Keys.statistics.rawValue)
    }
    
    func clearStatistics() {
        statistics = []
        LocalStorageService.shared.clearStatistics()
    }
}
