//
//  GameUIView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

struct TagUIView: View {
    @EnvironmentObject var model: GameEngineViewModel

    var body: some View {
        ZStack {
            model.applicationBackground
            Text(model.labelText)
                .font(.title)
                .foregroundStyle(model.tagViewTextColor)
                .frame(width: UIScreen.main.bounds.width * 0.5, height: 40)
                .background(model.tagViewBackgroundColor).opacity(0.7)
                .cornerRadius(15.0)
                .shadow(radius: 10, x: 0, y: 5)
                .offset(x: model.tagViewXPosition, y: model.tagViewYPosition)
                .onAppear {
                    model.screenBounds = UIScreen.main.bounds
                    model.initial()
                    model.startGameDurationTimer()
                    model.startGameEngineTimer()
                }
                .onDisappear {
                    model.stopTimer()
                }
            Button(action: {
                model.changeTimerInterval()
            }) {
                Text("x2")
                    .font(.system(size: 27))
                    .padding(EdgeInsets(top: 14, leading: 25, bottom: 14, trailing: 25))
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .cornerRadius(50)
            .shadow(radius: 5)
            .position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height * 0.8)

            .navigationTitle("\(model.formattedGameTime)")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .navigationBarItems(trailing: CustomPauseButton(action: {
                model.pauseTimer()
            }))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TagUIView()
        .environmentObject(GameEngineViewModel())
}
