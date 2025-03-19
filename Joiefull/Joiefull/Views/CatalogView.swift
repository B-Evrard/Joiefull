//
//  CatalogView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import SwiftUI

struct CatalogView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @ObservedObject var viewModel: CatalogViewModel
    @State private var selectedClothe: ClotheDisplay?
    @State private var isShowingDetail = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        if DisplayParamFactory.clotheRowParam.isIpad {
            
            HStack(spacing: 0) {

                NavigationStack {
                    createCatalog()
                }
                .frame(width: selectedClothe != nil ? calculMaxWidthCatalog(694) : nil)

                if let clothe = selectedClothe {

                    NavigationStack {
                        ZStack (alignment: .top) {
                            Color("ColorIpad").ignoresSafeArea()
                                ClotheDetailView(
                                    viewModel: ClotheDetailViewModel(
                                        repository: ClotheRepository(),
                                        clotheDisplay: clothe
                                    ),
                                    param: DisplayParamFactory.clotheDetailParam
                                )



                        }

                    }
                }
            }
//           NavigationSplitView (columnVisibility: $columnVisibility) {
//                
//           
//                createCatalog()
//                .navigationBarHidden(true)
//                .navigationSplitViewColumnWidth(min: 694, ideal: 800, max: 1000)
//            } detail: {
//                if let clothe = selectedClothe {
//                    
//                    NavigationStack {
//                        ZStack (alignment: .top) {
//                            Color("ColorIpad").ignoresSafeArea()
//                            ClotheDetailView(
//                                viewModel: ClotheDetailViewModel(
//                                    repository: ClotheRepository(),
//                                    clotheDisplay: clothe
//                                ),
//                                param: DisplayParamFactory.clotheDetailParam
//                            )
//                            //.navigationSplitViewColumnWidth(min: 0, ideal: 800, max: 1000)
//                        }
//                    }
//                }
//                else    {
//                    Spacer()
//                    .navigationSplitViewColumnWidth(1)
//                }
//                
//                
//            }
//            .navigationSplitViewStyle(.balanced)
//            
            
        } else {
            NavigationStack {
                createCatalog()
                    .navigationDestination(isPresented: $isShowingDetail) {
                        if let clothe = selectedClothe {
                            ClotheDetailView(
                                viewModel: ClotheDetailViewModel(
                                    repository: ClotheRepository(),
                                    clotheDisplay: clothe
                                ),
                                param: DisplayParamFactory.clotheDetailParam
                            )
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
                ForEach(viewModel.clothesCategory.keys.sorted(), id: \.self) { category in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(category.localized)
                                .font(.title2.weight(.semibold))
                                .limitedDynamicTypeSize()
                                .foregroundColor(.black)
                                .accessibilityElement(children: .ignore)
                                .accessibilityLabel("Catégories de vetements \(category.localized)" )
                            Spacer()
                            
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if DisplayParamFactory.clotheRowParam.isIpad {
                                selectedClothe = nil
                            }
                        }
                        
                          
                        let rows = [GridItem(.adaptive(minimum: adjustedSize(for: DisplayParamFactory.clotheRowParam.rowHeight), maximum: adjustedSize(for: DisplayParamFactory.clotheRowParam.rowHeight*2)))]
                        ScrollView(.horizontal) {
                            
                            LazyHGrid(rows: rows, spacing: 15) {
                                ForEach(viewModel.clothesByCategory(category), id: \.clothe.id) { clotheDisplay in
                                    ClotheRowView(clotheDisplay: .constant(clotheDisplay), param: DisplayParamFactory.clotheRowParam)
                                        .aspectRatio(contentMode: .fit)
                                        .onTapGesture {
                                            selectedClothe = clotheDisplay
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
        
        if let clothe = viewModel.clothesCategory.values.flatMap({ $0 }).first(where: { $0.id == id }) {
            selectedClothe = clothe
            isShowingDetail = true
        }
    }
    
}

#Preview {
    //let viewModel = CatalogViewModel(repository: ClotheRepository()  )
    //CatalogView(viewModel: viewModel)
}
