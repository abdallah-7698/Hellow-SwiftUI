//
//  Order.swift
//  Appetizers
//
//  Created by Abdallah on 10/04/2025.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published private(set) var appetizers: [Appetizer] = [] {
        didSet {
            appetizersPrice = appetizers.reduce(0) {$0 + $1.price}
            isOrdersEmpty = appetizers.isEmpty
        }
    }
    @Published private(set) var appetizersPrice: Double = 0
    @Published private(set) var isOrdersEmpty: Bool = true
    
    func add(_ appetizer: Appetizer) { appetizers.append(appetizer) }
    func remove(from offset: IndexSet) { appetizers.remove(atOffsets: offset) }
    
}
