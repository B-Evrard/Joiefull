//
//  ClothesListViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation
import SwiftUI


class CatalogViewModel: ObservableObject {
    
    
    @Published var clothesCategory: [ClotheCategory: [ClotheDisplay]] = [:]
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
    
    private let repository: ClotheRepository
    
    init(repository: ClotheRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchClothes() async {
        self.messageAlert = ""
        let result = await repository.getClothesFromAPI()
        switch result {
        case .success(let clothes):
            let clothesFilter = search.isEmpty ? clothes : clothes.filter {
                $0.name.lowercased().contains(self.search.lowercased())
            }
            let clothesDisplay = clothesFilter.map { clothe in
                return clothe.toDisplayModel(clotheNote: nil as ClotheNote?)
            }
            
            self.clothesCategory = Dictionary(grouping: clothesDisplay) { $0.clothe.category }
            return
        case .failure(let error):
            messageAlert = error.message
            return
        }
    }
    
}
