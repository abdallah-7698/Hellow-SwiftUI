//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Abdallah on 07/04/2025.
//

import SwiftUI

//AsyncImage(url: URL(string: "")) { image in
//    image.resizable()
//} placeholder: {
//    ProgressView()
//}


struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        HStack(spacing: 15) {
            
            AsyncImageView(stringURL: appetizer.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("empty-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 120, height: 90)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerItmeView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
