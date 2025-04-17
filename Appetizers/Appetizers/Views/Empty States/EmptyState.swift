//
//  EmptyState.swift
//  Appetizers
//
//  Created by Abdallah on 10/04/2025.
//

import SwiftUI


struct EmptyState<B>: View where B: View {
    
    enum EmptySates {
        case emptyOrders
        case noItems
        
        var systemImageName: String {
            switch self {
            case .emptyOrders:
                return "list.bullet.rectangle.portrait"
            case .noItems:
                return "list.bullet.rectangle.portrait"
            }
        }
        
        var message: String {
            switch self {
            case .emptyOrders:
                return "This is our test message.\n I'm making it a little long for testing."
            case .noItems:
                return "This is our test message.\n I'm making it a little long for testing."
            }
        }
    }
    
    
    private var emptyStateType: EmptySates
    private var buttonAction: (() -> B)

    public init(emptyStateType: EmptySates, @ViewBuilder buttonAction: @escaping () -> B = {EmptyView()}) {
        self.emptyStateType = emptyStateType
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(systemName: emptyStateType.systemImageName)
                    .resizable()
                    .frame(width: 110, height: 150)
                    .foregroundColor(.brandPrimary)
                
                Text(emptyStateType.message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                buttonAction()
            }.offset(y: -30)
            
            
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(emptyStateType: .emptyOrders)
    }
}
