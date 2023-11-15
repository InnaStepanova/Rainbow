//
//  ResultsView.swift
//  Rainbow
//
//  Created by Лаванда on 14.11.2023.
//

import SwiftUI


import SwiftUI

struct ResultsView: View {
    
    var results: [ResultModel]
    
    var body: some View {
            ScrollView {
                VStack {
                    ForEach(results, id: \.number) { result in
                        ResultCell(result: result)
                    }
                    Spacer()
                    Text("Очистить статистику")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .frame(width: 274, height: 83)
                        .background(Color.customRed)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color: .black.opacity(0.4), radius: 12, y: 2)
                }
            }
            .padding()
    }
}

#Preview {
    ResultsView(results: [ResultModel(number: 1, speed: 2, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 3),
        ResultModel(number: 2, speed: 2, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 3),
        ResultModel(number: 3, speed: 2, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 3)])
}
