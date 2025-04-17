//
//  OrderView.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import SwiftUI

struct OrderView: View {
        
    @Binding var selectedTab: Int
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            
            ZStack {
                List {
                    ForEach(order.appetizers) { AppetizerListCell(appetizer: $0) }
                        .onDelete(perform: order.remove )
                }
                .listStyle(.plain)
                .safeAreaInset(edge: .bottom){
                    APButton(
                        title: "$\(order.appetizersPrice, specifier: "%.2f") - Place Order",
                        frameWidth: UIScreen.main.bounds.width / 1.1,
                        frameHeight: 60
                    ) {
                        print("works")
                    }.padding(.bottom, -5)
                }
                
                if order.isOrdersEmpty {
                    EmptyState(emptyStateType: .emptyOrders) {
                        APButton(title: "GO SHOPING", cornerRadius: 0) {
                            selectedTab = 0
                        }
                    }
                }
            }
            
            .navigationTitle("🧾 Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(selectedTab: .constant(2))
    }
}
