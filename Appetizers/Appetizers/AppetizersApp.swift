//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(order)
        }
    }
}
