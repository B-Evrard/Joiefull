//
//  ClotheDetailViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 25/02/2025.
//

import Foundation

@MainActor
class ClotheDetailViewModel: ObservableObject {
    
    @Published var clotheDisplay: ClotheDisplay
    private let repository: ClotheRepository
    
    init(repository: ClotheRepository, clotheDisplay: ClotheDisplay) {
        self.repository = repository
        self.clotheDisplay = clotheDisplay
    }
    
    func readClotheNote() async {
        clotheDisplay.clotheNote = await repository.getClotheNote(id: clotheDisplay.id)
    }
    
    func saveClotheNote() async {
        await repository.updateClotheNote(clotheDisplay.clotheNote)
    }
    
        
}
