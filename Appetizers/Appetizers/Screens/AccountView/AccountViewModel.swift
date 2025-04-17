//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Abdallah on 09/04/2025.
//
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var errorMessage: ValidationError? = nil
    
    // MARK:  Only for demo learn
    @Published var showBanner:Bool = false
    @Published var successBannerData: BannerModifier.BannerData = BannerModifier.BannerData(title: "Profile Saved", detail: "Your profile information was successfully saved.", type: .Success)
        
    let upperDate = Calendar.current.date(byAdding: .year, value: -125, to: .now)!
    let lowerDate = Calendar.current.date(byAdding: .year, value: -6, to: .now)!
    
    func saveChanges() {
        guard isValidForm else {return}
        // encode the user into data and save it into user defaults
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            showBanner = true
        } catch {
            errorMessage = .invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            errorMessage = .invalidUserData
        }
    }
    
    private var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            errorMessage = .invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            errorMessage = .invalidEmail
            return false
        }
        
        return true
    }

}
