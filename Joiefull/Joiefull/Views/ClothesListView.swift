//
//  ClotheListView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClothesListView: View {
    
    @ObservedObject var viewModel: ClothesListViewModel
    //@StateObject private var navigation = NavigationViewModel()
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
