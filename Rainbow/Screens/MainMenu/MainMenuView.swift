//
//  MainMenuView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var model: GameEngineViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    model.applicationBackground.ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Image(.rainbow)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.8)
                            .shadow(radius: 10)
                        
                        Text("НЛП игра")
                            .font(.system(size: geometry.size.width * 0.1))
                        
                        Text("Радуга")
                            .font(.system(size: geometry.size.width * 0.17, weight: .light, design: .serif))
                            .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 4)
                        
                        Spacer()
                        
                        VStack(spacing: 16) {
                            NavigationLink(destination: TagUIView(statusGame: .newGame)) {
                                CustomButtonView(title: "Новая игра", color: .customPink)
                            }
                            
                            NavigationLink(destination: TagUIView(statusGame: .currentGame)) {
                                CustomButtonView(title: "Продолжить", color: .customBlue)
                            }
                            
                            NavigationLink(destination: StatisticsView()) {
                                CustomButtonView(title: "Статистика", color: .customGreen)
                            }
                        }
                        
                        HStack {
                            NavigationLink(destination: SettingsView()) {
                                CustomIconButtonView(
                                    name: "gearshape.fill",
                                    color: .customPurple
                                )
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: RulesMainView()) {
                                CustomIconButtonView(
                                    name: "questionmark",
                                    color: .customFuxia
                                )
                            }
                        }
                        .padding()
                    }
                    .preferredColorScheme(.light)
                }
            }
            
        }
    }
}

#Preview {
    MainMenuView()
        .environmentObject(GameEngineViewModel())
}
