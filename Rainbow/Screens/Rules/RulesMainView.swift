//
//  RulesMainView.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import SwiftUI

struct RulesMainView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Правила игры")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            HStack {
                Text("  На экране в случайном месте появляется слово, обозначающее цвет, например: написано «синий»:")
                    .font(.title2)
            }
            .padding(.bottom)
            
            HStack(alignment: .firstTextBaseline, spacing: 16) {
                VStack {
                    Text("подложка выключена:")
                    Text("синий")
                        .padding(.top)
                        .foregroundStyle(.red)
                        .font(.title)
                        .shadow(color: .black, radius: 10, x: 1, y: 1)
                }
                
                VStack {
                    Text("подложка включена:")
                    Text("  синий  ")
                        .shadow(color: .black, radius: 10, x: 1, y: 1)
                        .padding(10)
                        .padding(.horizontal, 5)
                        .background(
                            Capsule()
                                .fill(Color.green)
                        )
                        .foregroundStyle(Color.customPink)
                        .font(.title)
                }
            }
            .padding(.bottom)
            
            VStack {
                Text("  Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена): говорим «зеленый».")
                    .font(.title2)
                    .padding(.vertical)
                Text("  В игре можно изменять скорость от x1 до x5. А так же длительность игры.")
                    .font(.title2)
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Помощь")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    RulesMainView()
}
