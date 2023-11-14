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

        Text(model.labelText)
            .font(.title)
            .frame(width: UIScreen.main.bounds.width * 0.5, height: 40)
            .background(model.elementColor).opacity(0.7)
            .cornerRadius(15.0)
            .shadow(radius: 10, x: 0, y: 5)
            .offset(x: model.viewPosition, y: model.viewPosition)
            .onAppear {
                model.startTimer()
            }
            .onDisappear {
                model.stopTimer()
            }
        Button(action: {
            model.increaseTimerInterval(withTime: 2)
        }) {
            Text("x2")
                .font(.headline)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

#Preview {
    TagUIView()
        .environmentObject(GameEngineViewModel())
}
