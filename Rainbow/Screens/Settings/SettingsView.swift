//
//  SettingsView.swift
//  Rainbow
//
//  Created by nikita on 14.11.2023.
//


import SwiftUI

struct SettingsView: View {
    @AppStorage("minutesSlider") private var minutesSlider: Double = 2.0
    @AppStorage("speedOfChangingWords") private var speedOfChangingWords: Double = 5.0
    @AppStorage("backgroundForText") private var backgroundForText: Bool = false

    var body: some View {

        NavigationView {
            ZStack(alignment: .top) {
                Color.gray.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center) {
                        HStack {
                            Text("Время игры мин ")
                                .lineLimit(1)
                                .frame(width: 133)
                            Slider(value: $minutesSlider, in: 0...10, step: 1.0)
                                .frame(width: 111, height: 31)
                                .accentColor(Color.orange)
                            Text("\(Int(minutesSlider))")
                                .frame(width: 33)
                        }
                        .modifier(CustomStyle())

                        HStack {
                            Text("Скорость смены заданий, сек ")
                                .frame(width: 133)
                            Slider(value: $speedOfChangingWords, in: 0...5)
                                .frame(width: 111, height: 31)
                                .accentColor(Color.orange)
                            Text("\(Int(speedOfChangingWords))")
                                .frame(width: 33)
                        }

                        .modifier(CustomStyle())
                        HStack{
                            Toggle("Переключатель", isOn: $backgroundForText).padding(.trailing,8)
                        }
                        .modifier(CustomStyle())
                    }

                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: MainMenuView()  .navigationBarBackButtonHidden(true)) {
                            Image(systemName: "arrowshape.left.fill")
                                .foregroundColor(.black)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        HStack{
                            Text("Настройки")
                                .font(.title)
                        }
                    }
                }
            }
        }
        .onDisappear {
            LocalStorageService.shared.saveSettings(settings: SettingsModel(minutesSlider: minutesSlider, speedOfChangingWords: speedOfChangingWords, backgroundForText: backgroundForText), name: Keys.settings.rawValue)
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
