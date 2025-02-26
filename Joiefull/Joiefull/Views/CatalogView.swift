//
//  CatalogView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: ClothesListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.clothesByCategory.keys.sorted(), id: \.self) { category in
                VStack(alignment: .leading, spacing: 8) {
                    Text(category.localized)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(354))], spacing: 15 )  {
                            ForEach(viewModel.clothesByCategory[category] ?? [], id: \.id) { clothe in
                                ClotheRowIpadView(clothe: clothe)
                                    .frame(width: 222)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchClothes()
            }
        }
        .background(Color.white)
        .listStyle(PlainListStyle())
    }
    
    @ViewBuilder
    func createClotheImageView(for clothe: Clothe) -> some View {
        AsyncImage(url: URL(string: clothe.picture.url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 222, height: 255)
                    .clipShape(RoundedRectangle(cornerRadius: 15))

            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 222, height: 255)
                    .foregroundColor(.gray)

            @unknown default:
                EmptyView()
            }
        }
    }
    
    
    
}

#Preview {
    let viewModel = ClothesListViewModel(apiService: APIClient())
    CatalogView(viewModel: viewModel)
}
