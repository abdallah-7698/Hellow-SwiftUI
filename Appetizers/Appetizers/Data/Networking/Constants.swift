//
//  Constants.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import Foundation

enum Constants {

    static let AppetizersDB: URL = {
        guard let url = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()

}
