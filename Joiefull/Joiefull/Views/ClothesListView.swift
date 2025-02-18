//
//  ClotheListView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClothesListView: View {
    
    @ObservedObject var viewModel: ClothesListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.clothesByCategory.keys.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { category in
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(category.localized)
                            .font(.custom("OpenSans-SemiBold",  size: 22))
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.clothesByCategory[category] ?? [], id: \.id) { clothe in
                                    ClotheRowView(clothe: clothe)
                                }
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .background(Color.white)
            .listStyle(PlainListStyle())
        }
        .onAppear() {
            Task {
                await viewModel.fetchClothes()
            }
        }
    }
    
}

#Preview {
    let viewModel = ClothesListViewModel(apiService: APIClient())
    ClothesListView(viewModel: viewModel)
}
