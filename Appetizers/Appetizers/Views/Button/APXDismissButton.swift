//
//  APXDismissButton.swift
//  Appetizers
//
//  Created by Abdallah on 09/04/2025.
//

import SwiftUI

struct APXDismissButton: View {
    
    var action: () -> Void
    
    var frameWidth: CGFloat = 40
    var frameHeight: CGFloat = 40
    var foregroundColor: Color = .black
    var backgroundColor: Color = .white
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: frameWidth, height: frameHeight)
                    .foregroundColor(backgroundColor)
                    .opacity(0.6)
                    .shadow(radius: 5)
                
                Image(systemName: "xmark")
                    .imageScale(.medium)
                    .frame(width: frameWidth+5, height: frameHeight+5)
                    .foregroundColor(foregroundColor)
            }.padding(8)
        }
    }
}

struct APXDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        APXDismissButton {
            print("Button tapped!")
        }.preferredColorScheme(.dark)
    }
}
