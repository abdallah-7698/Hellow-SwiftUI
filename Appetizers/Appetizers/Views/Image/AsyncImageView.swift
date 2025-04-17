//
//  AsyncImageView.swift
//  Appetizers
//
//  Created by Abdallah on 08/04/2025.
//

import SwiftUI
import Netwoking

struct AsyncImageView<I, P>: View where I : View, P : View  {
    @StateObject private var loader = ImageLoader<UIImage>()
    
    private let stringURL: String
    private let content: (Image) -> I
    private let placeholder: () -> P
    
    public init(stringURL: String, @ViewBuilder content: @escaping (Image) -> I, @ViewBuilder placeholder: @escaping () -> P) {
        self.stringURL = stringURL
        self.content = content
        self.placeholder = placeholder
    }
    
    var body: some View {
        
        Group {
            if let image = loader.data {
                content(Image(uiImage: image) )
            } else {
                placeholder()
                    .onAppear {
                        loader.load(from: stringURL) { UIImage(data: $0) }
                    }
            }
        }
    }
}
