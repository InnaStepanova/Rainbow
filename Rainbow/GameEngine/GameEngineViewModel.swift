//
//  GameEngineViewModel.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

class GameEngineViewModel: ObservableObject {
    // MARK: - Model from settings
    var model = LocalStorageService.shared.loadSettings(settingsName: Keys.settings.rawValue)

    @Published var tagViewBackgroundColor: Color?                                   // Рандомный цвет вью
    @Published var labelText: String = ""                                           // Текст для лейбла
    @Published var tagViewTextColor: Color = .red                                   // Цвет текста лейбла тэг вью
    @Published var tagViewXPosition: CGFloat = CGFloat.random(in: -100...100)       // Рандомная позиция X
    @Published var tagViewYPosition: CGFloat = CGFloat.random(in: -100...100)       // Рандомная позиция Y
    @Published var changeViewTimerInterval: TimeInterval = 5.0                      // Ускорение игры по нажатию на кнопку
    @Published var roundDuration: TimeInterval = 300                                // Время раунда
    @Published var speedButtonText: String = "x2"
    @Published var shovAlert: Bool = false
    // MARK: list of statistical models, with game results.
    @Published var statistics: [StatisticModel] = []

    @AppStorage("minutesSlider")  var gameDuration: Double = 2.0
    @AppStorage("speedOfChangingWords")  var speedOfChangingWords: Double = 5.0
    @AppStorage("backgroundForText")  var backgroundForText: Bool = true

    let applicationBackground: Color = Color.mainBackground
    let colorsForTagBackground: [CustomColors] = CustomColors.allCases
    let textsForLabel: [TextForTagView] = TextForTagView.allCases
    var screenBounds: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    var changeImagePause: Bool = false
    private var timer: DispatchSourceTimer?
    private var raundTimer: Timer?
    private var timerToggle: Bool = false
    private var isRaundTimerPaused = false
    private var speedButtonCount = 2

    var formattedGameTime: String {
        let minutes = Int(roundDuration) / 60
        let seconds = Int(roundDuration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var sliderValueChanged: ((TimeInterval) -> Void)?
    var sliderValueChanged2: ((TimeInterval) -> Void)?

    // генерим и получаем статистические данные раунда игры
    var getRoundStatistic: StatisticModel {
        let number = statistics.count + 1
        let speed = Int(speedOfChangingWords)
        let time = Int(gameDuration)
        return StatisticModel(
            number: number,
            speed: speed,
            time: time,
            // убрать, если не реализуем функционал
            qtyQuestions: 0,
            qtyRightAnswers: 0
        )
    }


    func initial() {
        checkSettings()
        labelText = textsForLabel.randomElement()?.rawValue ?? ""
        tagViewBackgroundColor = isNeedShowTagBackground() ? randomColorGenerator(colors: colorsForTagBackground) : .clear
        tagViewTextColor = isNeedChangeTextColor() ? randomColorGenerator(colors: colorsForTagBackground) : .white
        roundDuration = gameDuration * 60
        sliderValueChanged?(roundDuration)
        changeViewTimerInterval = speedOfChangingWords
        sliderValueChanged2?(speedOfChangingWords)
        speedButtonText = "x\(speedButtonCount)"
        //roundDuration = model?.gameDuration ?? 300
    }

    func continueCurrentGame() {
        if let currentGame = LocalStorageService.shared.loadCurrentGame(key: Keys.currentGame.rawValue) {
            labelText = textsForLabel.randomElement()?.rawValue ?? ""
            tagViewBackgroundColor = isNeedShowTagBackground() ? randomColorGenerator(colors: colorsForTagBackground) : .clear
            tagViewTextColor = isNeedChangeTextColor() ? randomColorGenerator(colors: colorsForTagBackground) : .white
            roundDuration = currentGame.currentGameTime
            sliderValueChanged?(currentGame.currentGameTime)
            changeViewTimerInterval = currentGame.speed
            sliderValueChanged2?(currentGame.speed)
        } else {
            initial()
        }
    }

    private func checkSettings() {
        if model == nil {
            LocalStorageService.shared.saveSettings(settings: SettingsModel.init(), name: Keys.settings.rawValue)
            model = LocalStorageService.shared.loadSettings(settingsName: Keys.settings.rawValue) ?? SettingsModel()

        }
    }

    private func saveCurrentGame() {
        let currentGame = CurrentGameModel(
            speed: model?.speedOfChangingWords ?? 1.0,
            boost: 1.0,
            longGameTime: gameDuration,
            currentGameTime: roundDuration,
            isBackgroundForView: model?.isBackgroundForView ?? false)

        print("CURRENT GAME: \(currentGame)")

        LocalStorageService.shared.saveCurrentGame(currentGame, key: Keys.currentGame.rawValue)
    }

    func startGameEngineTimer() {
        if let timer = timer {
            timer.cancel()
        }
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

                sliderValueChanged?(changeViewTimerInterval)
                sliderValueChanged2?(speedOfChangingWords)


                shovAlert.toggle()

            }
        }
    }

    func pauseTimer() {
        timerToggle.toggle()
        timerToggle ? timer?.suspend() : timer?.resume()
        isRaundTimerPaused = timerToggle
    }

    private func stopTimer() {
        timer?.cancel()
        raundTimer?.invalidate()
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

    func updateStatistics() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let newStat = self.getRoundStatistic
            self.statistics.append(newStat)
            LocalStorageService.shared.saveStatistics(self.statistics, key: Keys.statistics.rawValue)
        }
    }

    func clearStatistics() {
        statistics = []
        LocalStorageService.shared.clearStatistics()
    }

    // MARK: - End game
    func endGame(isAlert: Bool) {
        speedButtonCount = 2
        stopTimer()
        if !isAlert {
            saveCurrentGame()
        }
    }

    // MARK: - User actions
    func speedButtonTapped() {
        speedButtonCount == 1 ? changeTimerInterval(isSlowingDown: true) :
                changeTimerInterval(isSlowingDown: false)
        speedButtonCount = ((speedButtonCount % 5) + 1)
        speedButtonText = "x\(speedButtonCount)"
        startGameEngineTimer()
    }

    private func changeTimerInterval(isSlowingDown: Bool) {
        guard (changeViewTimerInterval / 2) > 0 else { return }
        isSlowingDown ? (changeViewTimerInterval = speedOfChangingWords) : (changeViewTimerInterval /= 2)
    }
}
