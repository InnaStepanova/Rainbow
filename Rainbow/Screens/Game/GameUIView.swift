//
//  GameUIView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

enum StatusGame {
    case newGame
    case currentGame
}

struct TagUIView: View {
    @EnvironmentObject var model: GameEngineViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let statusGame: StatusGame

    var body: some View {
        ZStack {
            model.applicationBackground
            Text(model.labelText)
                .font(.title)
                .foregroundColor(model.backgroundForText ? model.tagViewTextColor : model.tagViewBackgroundColor) 
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: 40)
                                .background(model.backgroundForText ? model.tagViewBackgroundColor : Color.clear)
                                .cornerRadius(15.0)
                                .shadow(radius: 10, x: 0, y: 5)
                .offset(x: model.tagViewXPosition, y: model.tagViewYPosition)
                .onAppear {
                    if statusGame == .newGame {
                        model.screenBounds = UIScreen.main.bounds
                        model.initial()
                        model.startGameDurationTimer()
                        model.startGameEngineTimer()
                    } else if statusGame == .currentGame {
                        model.continueCurrentGame()
                        model.startGameDurationTimer()
                        model.startGameEngineTimer()
                    }
                }
                .onDisappear {
                    model.endGame(isAlert: false)
                }
            Button(action: {
                model.speedButtonTapped()
            }) {
                Text(model.speedButtonText)
                    .font(.system(size: 27))
                    .padding(EdgeInsets(top: 14, leading: 25, bottom: 14, trailing: 25))
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .cornerRadius(50)
            .shadow(radius: 5)
            .position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height * 0.9)

            .navigationTitle("\(model.formattedGameTime)")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .navigationBarItems(trailing: CustomPauseButton(action: {
                model.pauseTimer()
            }))
            .alert(isPresented: $model.shovAlert) {
                model.endGame(isAlert: true)
                return Alert(
                    title: Text("Поздравляем!"),
                    message: Text("Игра окончена"),
                    primaryButton: .default(Text("На главную страницу")) {
                        self.presentationMode.wrappedValue.dismiss()
                        model.updateStatistics()
                    },
                    secondaryButton: .default(Text("Новая игра")) {
                        // Действие при нажатии на "Новая игра"
                        model.initial()
                        model.startGameDurationTimer()
                        model.startGameEngineTimer()
                        model.updateStatistics()
                    }
                )
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TagUIView(statusGame: .newGame)
        .environmentObject(GameEngineViewModel())
}
