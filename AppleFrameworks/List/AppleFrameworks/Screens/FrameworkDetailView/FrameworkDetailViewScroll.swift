//
//  FrameworkDetailViewScroll.swift
//  AppleFrameworks
//
//  Created by Abdallah on 26/03/2025.
//

import SwiftUI

struct FrameworkDetailViewScroll: View {
        
    var frameworks : [Framework]
    var currentIbdex: Int
    @Binding var isShowingDetailView: Bool
    
    private let itemWidth = UIScreen.main.bounds.width
    private let itemHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        let frameworkItems : [FrameworkDetailView] = {
            MockData.frameworks.map{ FrameworkDetailView(framework: $0, isShowingDetailView: $isShowingDetailView)}
        }()
        
        HStack(alignment: .center, spacing: 30) {
            ForEach(0..<frameworkItems.count) { i in
                frameworkItems[i]
                    .frame(width: itemWidth, height: itemHeight, alignment: .center)
                    .cornerRadius(10)
            }
        }
        .modifier(ScrollingHStackModifier(items: frameworkItems.count, itemWidth: itemWidth, itemSpacing: 30, currentIndex: currentIbdex))
    }
}

struct FrameworkDetailViewScroll_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailViewScroll(frameworks: MockData.frameworks, currentIbdex: 0,isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
