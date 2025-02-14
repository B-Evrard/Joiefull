//
//  ClotheRowView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowView: View {
    
    let imageURL = URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/4.jpg")!
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 198, height: 198)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    

            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)

            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ClotheRowView()
}
