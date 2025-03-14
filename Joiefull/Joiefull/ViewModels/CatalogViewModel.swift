//
//  ClothesListViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation
import SwiftUI


class CatalogViewModel: ObservableObject {
    
    @Published var clothesByCategory: [ClotheCategory: [Clothe]] = [:]
    @Published var search: String = ""
    @Published var showAlert: Bool = false
    @Published var messageAlert: String = ""{
        didSet {
            if messageAlert.isEmpty {
                showAlert = false
            }
            else {
                showAlert = true
            }
        }
    }
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
   
    @MainActor
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
    
    func clothesByCategory(_ category: ClotheCategory) -> [Clothe] {
        return clothesByCategory[category] ?? []
    }
    
}
