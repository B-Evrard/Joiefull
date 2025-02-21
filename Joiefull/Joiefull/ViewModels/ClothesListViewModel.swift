//
//  ClothesListViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation

@MainActor
class ClothesListViewModel: ObservableObject {
    
    @Published var clothesByCategory: [ClotheCategory: [Clothe]] = [:]
    @Published var messageAlert: String = ""
    
    private let apiService: APIService
    
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchClothes() async {
        self.messageAlert = ""
        let result = await apiService.clothesList()
        switch result {
        case .success(let clothes):
            self.clothesByCategory = Dictionary(grouping: clothes) { $0.category }
            return
        case .failure(let error):
            messageAlert = error.message
            return
        }
    }
    
    
    
    
}
