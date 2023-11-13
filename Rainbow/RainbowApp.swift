//
//  RainbowApp.swift
//  Rainbow
//
//  Created by Лаванда on 13.11.2023.
//

import SwiftUI

@main
struct RainbowApp: App {

    @StateObject var model = GameScreenViewModel()

    var body: some Scene {
        WindowGroup {
            TagUIView()
        }
    }
}
