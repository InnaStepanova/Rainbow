//
//  StatisticCell.swift
//  Rainbow
//
//  Created by Лаванда on 14.11.2023.
//

import SwiftUI

struct StatisticCell: View {
    
    var statistics: StatisticModel
    
    var body: some View {
        VStack {
            HStack {
                Text("игра №\(statistics.number)")
                    .foregroundStyle(Color.customFuxia)
                Spacer()
                Text("скорость х\(statistics.speed)")
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            HStack {
                Text("время \(statistics.time) мин.")
                Spacer()
//                Text("угадано \(statistics.qtyRightAnswers)/\(statistics.qtyQuestions)")
//                    .fontWeight(.black)
//                    .foregroundStyle(Color.customLightGreen)
            }
        }
        .font(.system(size: 20))
        .padding()
        .background(Color.cellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4, x: 0, y: 4)
        
    }
}

#Preview {
    StatisticCell(statistics: 
                    StatisticModel(
                        number: 1,
                        speed: 2,
                        time: 1,
                        qtyQuestions: 0,
                        qtyRightAnswers: 0
                    )
    )
}
