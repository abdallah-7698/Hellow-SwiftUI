//
//  CameraError.swift
//  BarcodeScanner
//
//  Created by Abdallah on 30/03/2025.
//

import Foundation

enum CameraError: LocalizedError {
    case invalidDeviceInput
    case invalidScannedValue
    
    var errorDescription: String? {
        switch self {
        case .invalidDeviceInput:
            return "Invalid Devide Input"
        case .invalidScannedValue:
            return "Invalid Scan Type"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidDeviceInput:
            return "Something is wrong with the camera. We are unable to capture the input."
        case .invalidScannedValue:
            return "The value scanned is not valid, This app scans EAN-8 and EAN-13."
        }
    }
    
}
