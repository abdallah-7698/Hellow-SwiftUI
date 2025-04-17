//
//  DetailView.swift
//  AppleFrameworks
//
//  Created by Abdallah on 23/03/2025.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingWebView = false
        
    var body: some View {
        VStack(spacing: 5){
            
            VStack(spacing: 5) {
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(framework.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .padding()
            }.padding()
                
            
            Text(framework.description)
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.top, -40)
//            Spacer()
            
            AFButton(title: "Learn More", action: {
                isShowingWebView = true
            })
        }.offset(y: -50)

        .fullScreenCover(isPresented: $isShowingWebView) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
    
}


struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
            .environment(\.layoutDirection, .leftToRight)
    }
}
