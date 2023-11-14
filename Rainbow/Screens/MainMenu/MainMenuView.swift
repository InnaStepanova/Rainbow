//
//  MainMenuView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var viewModel: GameEngineViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.gray.ignoresSafeArea()
                    
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
                            NavigationLink(destination: TagUIView()) {
                                CustomButtonView(title: "Новая игра", color: .customPink)
                            }
                            
                            NavigationLink(destination: Text("CONTINUE PLAYING VIEW")) {
                                CustomButtonView(title: "Продолжить", color: .customBlue)
                            }
                            
                            NavigationLink(destination: Text("STATISTICS VIEW")) {
                                CustomButtonView(title: "Статистика", color: .customGreen)
                            }
                        }
                        
                        HStack {
                            NavigationLink(destination: SettingsView()) {
                                CustomIconButtonView(name: "gearshape.fill")
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: RulesMainView()) {
                                CustomIconButtonView(name: "questionmark")
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
}

// MARK: - CustomButtons
struct CustomButtonView: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .font(.system(size: 20))
            .frame(width: 274, height: 83)
            .background(color)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(color: .black.opacity(0.4), radius: 12, y: 2)
    }
}

struct CustomIconButtonView: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .frame(width: 45, height: 50)
            .foregroundStyle(Color.white)
            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
    }
}
