//
//  GameUIView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

struct TagUIView: View {
    @StateObject var model: GameEngineViewModel = GameEngineViewModel()

    var body: some View {
        HStack {
            Text(model.labelText)
//                .foregroundStyle(Color(model.elementColor)).opacity(0.9)
                .font(.title)
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: 40)
        .background(model.elementColor).opacity(0.7)
        .cornerRadius(15.0)
        .shadow(radius: 10, x: 0, y: 5)
        .onAppear {
            model.startTimer()
        }
        .onDisappear {
            model.stopTimer()
        }
    }
}

#Preview {
    TagUIView()
}
