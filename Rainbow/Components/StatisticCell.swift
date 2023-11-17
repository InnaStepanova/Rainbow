//
//  StatisticCell.swift
//  Rainbow
//
//  Created by Лаванда on 14.11.2023.
//

import SwiftUI

struct StatisticCell: View {
    
    var result: StatisticModel
    
    var body: some View {
        VStack {
            HStack {
                Text("игра №\(result.number)")
                    .foregroundStyle(Color.customFuxia)
                Spacer()
                Text("скорость х\(result.speed)")
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            HStack {
                Text("время \(String(format: "%.1f", result.time))")
                Spacer()
                Text("угадано \(result.qtyRightAnsver)/\(result.qtyQwestions)")
                    .fontWeight(.black)
                    .foregroundStyle(Color.customLightGreen)
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
    StatisticCell(result: StatisticModel(number: 1, speed: 1, time: 1.0, qtyQwestions: 5, qtyRightAnsver: 1))
}
