//
//  Appetizers.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
     static let sampleAppetizer = Appetizer(id: 00001,
                                            name: "Test Appetizer",
                                            description: "This is the description for my Appetizer. It's yummy.",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 99,
                                            carbs: 99)
    
}
