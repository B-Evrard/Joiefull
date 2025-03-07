//
//  ClothesListViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation
import SwiftUI

@MainActor
class CatalogViewModel: ObservableObject {
    
    @Published var clothesByCategory: [ClotheCategory: [Clothe]] = [:]
    @Published var messageAlert: String = ""
    @Published var search: String = ""
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchClothes() async {
        self.messageAlert = ""
        let result = await apiService.clothesList()
        switch result {
        case .success(let clothes):
            let clothesFilter = search.isEmpty ? clothes : clothes.filter {
                $0.name.lowercased().contains(self.search.lowercased())
            }
            self.clothesByCategory = Dictionary(grouping: clothesFilter) { $0.category }
            return
        case .failure(let error):
            messageAlert = error.message
            return
        }
    }
    
    
    
    
    
    
}
