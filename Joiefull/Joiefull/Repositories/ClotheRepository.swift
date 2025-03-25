//
//  ClotheRepository.swift
//  Joiefull
//
//  Created by Bruno Evrard on 16/03/2025.
//

import Foundation

class ClotheRepository {
    
    private let apiService: APIService
    private let localStorage: ClotheNoteStorage
    
    init(apiService: APIService = APIClient(), localStorage: ClotheNoteStorage = ClotheNoteStorageService.shared) {
        self.apiService = apiService
        self.localStorage = localStorage
    }
    
    func getClothesFromAPI() async -> Result<[Clothe],APIError> {
        let result = await apiService.clothesList()
        return result
    }
    
    func getClotheNote(id: Int) async -> ClotheNote {
        let clotheNote = localStorage.getNote(for: id)
        return clotheNote
    }
    
    func updateClotheNote(_ clotheNote: ClotheNote) async {
        localStorage.updateNote(for: clotheNote.id, rating: clotheNote.rating, comment: clotheNote.comment, favorite: clotheNote.favorite)
    }
}
