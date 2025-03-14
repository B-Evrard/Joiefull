//
//  CatalogView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import SwiftUI

struct CatalogView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    @ObservedObject var viewModel: CatalogViewModel
    
    @State private var selectedClothe: Clothe?
    @State private var isShowingDetail = false
    
    var body: some View {
        if DisplayParamFactory.clotheRowParam.isIpad {
            
                HStack(spacing: 0) {
                    
                    NavigationStack {
                        createCatalog()
                    }
                    .frame(width: selectedClothe != nil ? calculWidth(730): nil)
                    .frame(maxWidth: selectedClothe == nil ? .infinity : nil)
                    
                    
                    if let clothe = selectedClothe {
                        
                        NavigationStack {
                            ZStack (alignment: .topLeading) {
                                Color("ColorIpad").ignoresSafeArea()
                                ClotheDetailView(viewModel: ClotheDetailViewModel(clothe: clothe), param: DisplayParamFactory.clotheDetailParam)
                                Button(action: {
                                    withAnimation {
                                        selectedClothe = nil
                                    }
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Circle().fill(Color.white.opacity(0.5)))
                                        .shadow(radius: 3)
                                }
                                .padding(10)
                            }
                            
                        }
                    }
                }
                
                
            
            
        } else {
            NavigationStack {
                createCatalog()
                    .navigationDestination(isPresented: $isShowingDetail) {
                        if let clothe = selectedClothe {
                            ClotheDetailView(viewModel: ClotheDetailViewModel(clothe: clothe), param: DisplayParamFactory.clotheDetailParam)
                        }
                    }
                
                
            }
        }
    }
    
    @ViewBuilder
    func createCatalog() -> some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Rechercher un vêtement...", text: $viewModel.search)
                    .font(.body)
                    .limitedDynamicTypeSize()
                    .autocorrectionDisabled(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .onChange(of: viewModel.search) {
                        Task {
                            await viewModel.fetchClothes()
                        }
                    }
                Button {
                    viewModel.search.removeAll()
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(viewModel.search.isEmpty ? Color.gray : Color.black)
                }
                
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Zone de recherche des vêtements" )
            .accessibilityHint(.init("Tapez votre recherche ici"))
            .padding()
            List {
                ForEach(viewModel.clothesByCategory.keys.sorted(), id: \.self) { category in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(category.localized)
                            .font(.title2.weight(.semibold))
                            .limitedDynamicTypeSize()
                            .foregroundColor(.black)
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel("Catégories de vetements \(category.localized)" )
                        
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [GridItem(.adaptive(minimum: adjustedSize(for: DisplayParamFactory.clotheRowParam.rowHeight)))], spacing: 15) {
                                ForEach(viewModel.clothesByCategory[category] ?? [], id: \.id) { clothe in
                                    ClotheRowView(clothe: clothe, param: DisplayParamFactory.clotheRowParam)
                                        .aspectRatio(contentMode: .fit)
                                        .onTapGesture {
                                            selectedClothe = clothe
                                            isShowingDetail = true
                                        }
                                }
                            }
                            
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchClothes()
                }
            }
            .onOpenURL { incomingURL in
                handleDeepLink(url: incomingURL)
            }
            .alert(viewModel.messageAlert, isPresented: $viewModel.showAlert  ) {
                Button("OK") { }
            }
            
            .listStyle(PlainListStyle())
        }
        .background(DisplayParamFactory.clotheRowParam.isIpad ? Color("ColorIpad") : Color.clear)
    }
    
    private func handleDeepLink(url: URL) {
        guard url.scheme == "joiefull",
              url.host == "clothe",
              let idString = url.pathComponents.last,
              let id = Int(idString) else { return }
        
        if let clothe = viewModel.clothesByCategory.values.flatMap({ $0 }).first(where: { $0.id == id }) {
            selectedClothe = clothe
            isShowingDetail = true
        }
    }
    
    private func calculWidth(_ catalogWidth: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let detailWidth = screenWidth - CGFloat(720)
        let diff = adjustedSize(for: detailWidth) - detailWidth
        return catalogWidth - diff
    }
}

#Preview {
    let viewModel = CatalogViewModel(apiService: APIClient())
    CatalogView(viewModel: viewModel)
}
