//
//  BarcodeScanner.swift
//  BarcodeScanner
//
//  Created by Abdallah on 30/03/2025.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel: BarcodeScannerViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    
                    if viewModel.scannedCode.isEmpty {
                        ScannerView(scannedCode: $viewModel.scannedCode, cameraError: $viewModel.cameraError)
                    }
                    
                    if viewModel.isShowingRetryButton {
                        Button {
                            viewModel.retryAction()
                        } label: {
                            Text("↻")
                                .font(.system(size: 100))
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(error: $viewModel.cameraError) {_ in
                Button ("OK", role: .cancel) { }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
            .preferredColorScheme(.dark)
    }
}
