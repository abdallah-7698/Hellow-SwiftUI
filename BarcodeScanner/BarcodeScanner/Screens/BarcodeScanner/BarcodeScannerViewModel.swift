//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Abdallah on 30/03/2025.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode: String = ""
    @Published var cameraError: CameraError?
    
    var statusText: String {
        scannedCode.isEmpty ?  "Not Yet Scanned" : scannedCode
    }
    
    var isShowingRetryButton: Bool {
        scannedCode.isEmpty ?  false : true
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
    func retryAction() {
        scannedCode = ""
    }
}
