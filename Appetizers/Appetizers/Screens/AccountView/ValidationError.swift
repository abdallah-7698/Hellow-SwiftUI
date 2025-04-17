//
//  ValidationError.swift
//  Appetizers
//
//  Created by Abdallah on 09/04/2025.
//

import Foundation

enum ValidationError: LocalizedError {
    case invalidForm
    case invalidEmail
    case userSafeSuccess
    case invalidUserData
    
    var errorDescription: String? {
        switch self {
        case .invalidForm:
            return "Invalid Form"
        case .invalidEmail:
            return "Invalid Email"
        case .userSafeSuccess:
            return "Profile Saved"
        case .invalidUserData:
            return "Profile Error"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidForm:
            return "Please ensure all fields in the form have been filled out."
        case .invalidEmail:
            return "Please ensure your email is correct."
        case .userSafeSuccess:
            return "Your profile information."
        case .invalidUserData:
            return "There was an error saving or retrieving your profile."
        }
    }
    
}
