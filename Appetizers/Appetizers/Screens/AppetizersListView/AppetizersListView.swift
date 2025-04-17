//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject private var viewModel: AppetizersViewModel = .init()
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                                viewModel.isShowingDetails = true
                            }
                    }
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetails)
                    
                    if viewModel.isAppetizerListEmpty {
                        EmptyState(emptyStateType: .noItems) {
                            APButton(title: "RELOAD", cornerRadius: 0) {
                                viewModel.getAppetizers()
                            }
                        }
                    }
                }
                .navigationTitle("🍟 Appetizers")
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            if viewModel.isShowingDetails {
                DetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetails)
            }
            
            if viewModel.isLoading { LoadingView() }
            
        }
        .alert(error: $viewModel.alertError) { _ in
            Button ("OK", role: .cancel) { }
        }
    }
    
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
