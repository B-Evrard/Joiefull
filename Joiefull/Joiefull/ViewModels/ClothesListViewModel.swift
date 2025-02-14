//
//  ClothesListViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation

@MainActor
class ClothesListViewModel: ObservableObject {
    
    @Published var clothes: [Clothe] = []
    @Published var messageAlert: String = ""
    
    private let apiService: APIService
    
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchClothes() async {
        self.messageAlert = ""
        let result = await apiService.clothesList()
        switch result {
        case .success(let clothesList):
            self.clothes = clothesList
            filterAndSort()
            return
            
        case .failure(let error):
            messageAlert = error.message
            return
        }
    }
    
    private func filterAndSort() {
        for (_, clothes) in clothes.enumerated() {
            print(clothes.category.localized)
        }
    }
    
    
}
