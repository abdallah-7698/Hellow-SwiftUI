//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import Foundation
import Netwoking

final class AppetizersViewModel: ObservableObject{
    
    @Published var appetizers: [Appetizer] = [] {
        didSet {
            isAppetizerListEmpty = appetizers.isEmpty && !isLoading
        }
    }
    @Published var alertError: APError?
    @Published var isLoading = false
    
    @Published var isShowingDetails = false
    @Published var selectedAppetizer: Appetizer?
    
    @Published var isAppetizerListEmpty = true
    
    // Call this func in the main so when you move in the TabBar from view to another not reload the data
    // If you want to make the reload when appear call the func on .task in the view
    init() { getAppetizers() }
    
    func getAppetizers() {
        isLoading = true
        
        Task { @MainActor in
            do {
                let appetizers = try await AppetizersRequest().perform()
                self.appetizers = appetizers.request
                self.isLoading = false
            } catch {
                self.handleError(error)
                self.isLoading = false
            }
        }
    }
    
    private func handleError(_ error: Error) {
        switch error {
        case let apError as APError:
            self.alertError = apError
        case let networkError as NetworkError:
            switch networkError {
            case .invalidURL:
                self.alertError = .invalidURL
            case .invalidResponse:
                self.alertError = .invalidResponse
            case .timeOutRequest:
                self.alertError = .timeOutRequest
            }
        default:
            self.alertError = .unableToComplete
        }
    }
    
}
