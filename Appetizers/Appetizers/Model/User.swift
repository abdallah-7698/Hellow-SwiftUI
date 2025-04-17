//
//  User.swift
//  Appetizers
//
//  Created by Abdallah on 09/04/2025.
//

import Foundation

struct User: Codable {
    var firstName: String   = ""
    var lastName: String    = ""
    var email: String       = ""
    var birthday            = Date()
    var extraNapkins        = false
    var frequestRefills     = false
}
