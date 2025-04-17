//
//  DetailView.swift
//  Appetizers
//
//  Created by Abdallah on 08/04/2025.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var order: Order
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        VStack{
            
            AsyncImageView(stringURL: appetizer.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("empty-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: screenWidth/1.28, height: screenHeight/3.7)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .font(.body)
                    .padding(3)
                
                FoodInfoCardStack(appetizer: appetizer)
            }
            
            Spacer()
                .frame(minHeight: 0, maxHeight: 20)
            
            APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order"
            ) {
                order.add(appetizer)
                isShowingDetail = false
            }.padding(.top, -15)
            
        }
        .frame(width: screenWidth/1.28, height: screenHeight/1.45)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            APXDismissButton { isShowingDetail = false }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}

struct FoodInfoCardStack: View {
    var appetizer: Appetizer
    var body: some View {
        HStack {
            FoodInfoCard(title: "Calories", number: appetizer.calories)
            FoodInfoCard(title: "Carbs", number: appetizer.carbs)
            FoodInfoCard(title: "Protein", number: appetizer.protein)
        }
    }
}

struct FoodInfoCard: View {
    
    var title: String
    var number: Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(title)
                .font(.body)
            Text("\(number)")
                .font(.body)
                .italic()
                .foregroundColor(.secondary)
        }.padding(.leading, 8)
            .padding(.trailing, 8)
    }
}
