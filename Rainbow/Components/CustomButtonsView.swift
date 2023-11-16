//
//  CustomButtonsView.swift
//  Rainbow
//
//  Created by Alex on 15.11.2023.
//

import SwiftUI

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
