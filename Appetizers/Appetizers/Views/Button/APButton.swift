//
//  APButton.swift
//  Appetizers
//
//  Created by Abdallah on 09/04/2025.
//

import SwiftUI

struct APButton: View {
    
    var title: LocalizedStringKey
    
    var frameWidth: CGFloat = UIScreen.main.bounds.width/1.44
    var frameHeight: CGFloat = 55
    var backgroundColor: Color = .brandPrimary
    var textColor: Color = .white
    var cornerRadius: CGFloat = 10
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: frameWidth, height: frameHeight)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(cornerRadius)
                .padding(.bottom, 10)
        }
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Click Me", action: {
            print("Button tapped!")
        })
        .preferredColorScheme(.dark)
    }
}
