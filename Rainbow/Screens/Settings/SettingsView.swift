//
//  SettingsView.swift
//  Rainbow
//
//  Created by nikita on 14.11.2023.
//


import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var model: GameEngineViewModel

    var body: some View {

            ZStack(alignment: .top) {
                model.applicationBackground.ignoresSafeArea()
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack {
                            Text("Время игры мин ")
                                .lineLimit(1)
                                .frame(width: 133)
                            Slider(value: $model.roundDuration, in: 1...10, step: 1.0)
                                .frame(width: 111, height: 31)
                                .accentColor(Color.orange)
                            Text("\(Int(model.roundDuration))")
                                .frame(width: 33)
                        }
                        .modifier(CustomStyle())
                        
                        HStack {
                            Text("Скорость смены заданий, сек ")
                                .frame(width: 133)
                            Slider(value: $model.speedOfChangingWords, in: 1...5)
                                .frame(width: 111, height: 31)
                                .accentColor(Color.orange)
                            Text("\(Int(model.speedOfChangingWords))")
                                .frame(width: 33)
                        }
                        
                        .modifier(CustomStyle())
                        HStack{
                            Toggle("Подложка для букв ", isOn: $model.backgroundForText).padding(.trailing,8)
                        }
                        .modifier(CustomStyle())
                    }
            }
                .padding()
                    .navigationTitle("Настройки")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: CustomBackButton())
        }
        .onDisappear {
            LocalStorageService.shared.saveSettings(settings: SettingsModel(gameDuration: model.roundDuration, speedOfChangingWords: model.speedOfChangingWords, isBackgroundForView: model.backgroundForText), name: Keys.settings.rawValue)
        }
    }
}
// MARK: - CustomStyle
struct CustomStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 8)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
