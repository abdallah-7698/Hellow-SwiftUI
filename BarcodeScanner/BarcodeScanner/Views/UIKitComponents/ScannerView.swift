//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Abdallah on 30/03/2025.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var cameraError: CameraError?
    
    private let scannerVC = ScannerVC()
    
    func makeUIViewController(context: Context) -> ScannerVC {
        scannerVC.scannerDelegate = context.coordinator
        return scannerVC
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerView: self)
    }
}

extension ScannerView {
    func stratReloading() {
        scannerVC.restartLoading()
    }
}

// MARK: Coordinator
///- UIViewController --> Coordinator --> SwiftUI View
extension ScannerView {
    final class Coordinator: NSObject, ScannerVCDelegate {
        private var scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            DispatchQueue.main.async {
                self.scannerView.cameraError = error
            }
        }
    }
}
