//
//  StatisticsView.swift
//  Rainbow
//
//  Created by Лаванда on 14.11.2023.
//

import SwiftUI

struct StatisticsView: View {
    
    var results: [StatisticModel]
    @EnvironmentObject var model: GameEngineViewModel
    
    var body: some View {

        VStack{
            ScrollView {
                VStack (spacing: 18) {
                    ForEach(results, id: \.number) { result in
                        StatisticCell(result: result)
                    }
                }
            
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
            .padding()
            .navigationTitle("Статистика")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .background(model.applicationBackground)
    }
}

//#Preview {
//    StatisticsView(results: [StatisticModel(number: 1, speed: 2, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 3),
//        StatisticModel(number: 2, speed: 2, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 3),
//                          StatisticModel(number: 3, speed: 2, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 3)], model: GameEngineViewModel())
//}
