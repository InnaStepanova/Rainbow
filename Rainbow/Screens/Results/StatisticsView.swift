//
//  StatisticsView.swift
//  Rainbow
//
//  Created by Лаванда on 14.11.2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @EnvironmentObject var model: GameEngineViewModel
    
    var body: some View {
        
        ZStack {
            model.applicationBackground.ignoresSafeArea()
            
            VStack{
                ScrollView(showsIndicators: false) {
                    VStack (spacing: 18) {
                        if model.statistics.isEmpty {
                            Text("Здесь будет ваша статистика по играм")
                                .font(.title3)
                                .foregroundStyle(.white)
                        } else {
                            ForEach(model.statistics, id: \.number ) { statistic in
                                StatisticCell(statistics: statistic)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    model.clearStatistics()
                } label: {
                    CustomButtonView(title: "Очистить статистику", color: .customRed)
                }
            }
            .padding()
            .navigationTitle("Статистика")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
        }
        .onAppear {
            model.loadStatistics()
        }
    }
}

#Preview {
    StatisticsView()
        .environmentObject(GameEngineViewModel())
}
