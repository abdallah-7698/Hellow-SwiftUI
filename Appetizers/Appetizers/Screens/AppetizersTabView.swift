//
//  ContentView.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import SwiftUI

struct AppetizersTabView: View {
   
    @State private var selectedTab = 0 {
        didSet {
            print("newValue is \(selectedTab)")
        }
    }
    
    init() { keepTabBarColorsFixed() }
    
    var body: some View {

        TabView(selection: $selectedTab) {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
                .tag(1)
            
            OrderView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .tag(2)
        }
        .accentColor(.brandPrimary)
    }
    
    private func keepTabBarColorsFixed() {
        let appearance = UITabBarAppearance()
          appearance.configureWithDefaultBackground()
          UITabBar.appearance().standardAppearance = appearance
          UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
