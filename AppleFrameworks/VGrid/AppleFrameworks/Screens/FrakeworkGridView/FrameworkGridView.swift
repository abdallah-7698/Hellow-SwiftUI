//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Abdallah on 23/03/2025.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModle = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModle.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModle.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModle.isShowingDetailView) {
                // TODO:  make an error view not use (!)
                FrameworkDetailView(framework: viewModle.selectedFramework!, isShowingDetailView: $viewModle.isShowingDetailView)
            }
            
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

