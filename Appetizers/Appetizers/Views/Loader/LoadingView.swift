//
//  LoadingView.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    
}

struct LoadingView: View {
    var tintColor: Color = .brandPrimary
    var scaleSize: CGFloat = 3.0
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)

            if #available(iOS 14.0, *) {
                ProgressView()
                    .scaleEffect(scaleSize, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
            } else {
                ActivityIndicator()
            }
            
        }
        
    }
}
