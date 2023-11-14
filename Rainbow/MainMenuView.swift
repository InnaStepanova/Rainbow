//
//  MainMenuView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

struct MainMenuView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainBackground.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image(.rainbow)
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity)
                        .shadow(radius: 10)
                    
                    Text("НЛП игра")
                        .font(.system(size: 36))
                    
                    Text("Радуга")
                        .font(.system(size: 64, weight: .light, design: .serif))
                        .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 4)
                    
                    Spacer()
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: Text("NEW GAME VIEW")) {
                            CustomButtonView(title: "Новая игра", color: .customRed)
                        }
                        
                        NavigationLink(destination: Text("CONTINUE PLAYING VIEW")) {
                            CustomButtonView(title: "Продолжить", color: .customBlue)
                        }
                        
                        NavigationLink(destination: Text("STATISTICS VIEW")) {
                            CustomButtonView(title: "Статистика", color: .customGreen)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: Text("SETTINGS VIEW")) {
                            CustomIconButtonView(name: "gearshape.fill")
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: Text("RULES VIEW")) {
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
            .foregroundStyle(.customPurple)
            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
    }
}
