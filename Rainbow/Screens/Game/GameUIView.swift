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
                    .font(.system(size: 27))
                    .padding(EdgeInsets(top: 14, leading: 25, bottom: 14, trailing: 25))
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .cornerRadius(50)
            .shadow(radius: 5)
            .position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height * 0.8)

            .navigationTitle("\(model.timerInterval)")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
        }
        .ignoresSafeArea()
    }

}

#Preview {
    TagUIView()
        .environmentObject(GameEngineViewModel())
}
