//
//  CustomBackButton.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrowshape.left.fill")
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(.black)
        }
    }
}

struct CustomPauseButton: View {

    let action: ()->()
    @State var changeImagePause: Bool = false
    var body: some View {
        Button(action: {
            changeImagePause.toggle()
            action()
        }) {
            Image(systemName: changeImagePause ? "play.fill" : "pause.fill")
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    CustomBackButton()
}
