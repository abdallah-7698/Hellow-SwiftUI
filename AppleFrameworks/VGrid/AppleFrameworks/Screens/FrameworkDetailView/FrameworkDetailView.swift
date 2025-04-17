//
//  DetailView.swift
//  AppleFrameworks
//
//  Created by Abdallah on 23/03/2025.
//

import SwiftUI

/* ---> to know
 1- how to make the item reusabel ( I can pass the data but i can not pass the parameters like  the imaeg i can pass the image name but can not pass the image frame so i can not reuse the component
 2- make a file with different ways to modify the proberty for example in the text make an extension .applyStyle() with the enum another way make different classes and reuse one default
 the first method       Text("name").applyStyle(.default)
 the second method      DefaultText("name")
 --> see which is the better to reuse and maintain and is there any better ways
 */

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack(spacing: 5){

            XDismissButton(isShowingDetailView: $isShowingDetailView)
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            AFButton(title: "Learn More", action: {
                isShowingSafariView = true
            })
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
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
