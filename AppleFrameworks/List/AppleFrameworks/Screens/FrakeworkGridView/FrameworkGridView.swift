//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Abdallah on 23/03/2025.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModle = FrameworkGridViewModel()
    
    // data model
    private let frameworks = MockData.frameworks
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(frameworks.indices) { index in
                    NavigationLink(destination: FrameworkDetailViewScroll(frameworks: frameworks, currentIbdex: index, isShowingDetailView: $viewModle.isShowingDetailView)) {
                        FrameworkTitleView(framework: frameworks[index])
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

