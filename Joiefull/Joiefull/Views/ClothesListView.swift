//
//  ClotheListView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClothesListView: View {
    
    @ObservedObject var viewModel: ClothesListViewModel
    @State private var selectedClothe: Clothe? = nil
    @State private var isShowingDetail = false
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            HStack(spacing: 0) {
                    
                    NavigationStack {
                        createCatalog()
                    }
                    .frame(width: selectedClothe != nil ? 754 : nil)
                    .frame(maxWidth: selectedClothe == nil ? .infinity : nil)
                    
                    if let clothe = selectedClothe {
                        Divider()
                        
                        NavigationStack {
                            ClotheDetailIpadView(viewModel: ClotheDetailViewModel(clothe: clothe))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
        } else {
            NavigationStack {
                createCatalog()
                    .navigationDestination(isPresented: $isShowingDetail) {
                        if let clothe = selectedClothe {
                            ClotheDetailPhoneView(viewModel: ClotheDetailViewModel(clothe: clothe))
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    func createCatalog() -> some View {
        List {
            ForEach(viewModel.clothesByCategory.keys.sorted(), id: \.self) { category in
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(category.localized)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.clothesByCategory[category] ?? [], id: \.id) { clothe in
                                createClotheRowView(for: clothe)
                                    .onTapGesture {
                                        selectedClothe = clothe
                                        isShowingDetail = true
                                    }
                            }
                        }
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .background(Color.white)
        .listStyle(PlainListStyle())
        .onAppear {
            Task {
                await viewModel.fetchClothes()
            }
        }
    }
    
    @ViewBuilder
    func createClotheRowView(for clothe: Clothe) -> some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            ClotheRowIpadView(clothe: clothe)
        } else {
            ClotheRowPhoneView(clothe: clothe)
        }
    }
    
}





#Preview {
    let viewModel = ClothesListViewModel(apiService: APIClient())
    ClothesListView(viewModel: viewModel)
}
