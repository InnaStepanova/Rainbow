//
//  RainbowApp.swift
//  Rainbow
//
//  Created by Лаванда on 13.11.2023.
//

import SwiftUI

@main
struct RainbowApp: App {

    @StateObject private var viewModel = GameEngineViewModel()

    var body: some Scene {
        WindowGroup {
            MainMenuView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    MainMenuView()
}
