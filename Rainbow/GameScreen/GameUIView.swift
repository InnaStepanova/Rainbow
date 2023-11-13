//
//  GameUIView.swift
//  Rainbow
//
//  Created by Alex on 13.11.2023.
//

import SwiftUI

struct TagUIViewData {
    let label: String
    let background: UIColor
    let isCheckBoxHidden: Bool
    let isCheckBoxActive: Bool
}


struct TagUIView: View {

    var model: TagUIViewData

    var body: some View {
        HStack {
            Text(model.label)
        }
        .frame(width: 200, height: 50)
        .background(Color(model.background))
    }
}

struct GameUIView: View {

    var model: TagUIViewData

    var body: some View {
        TagUIView(model: model)
    }
}

#Preview {
    GameUIView(model: TagUIViewData(label: "Test", background: .red, isCheckBoxHidden: true, isCheckBoxActive: true))
}
