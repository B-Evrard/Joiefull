//
//  ClotheDetailViewModel.swift
//  Joiefull
//
//  Created by Bruno Evrard on 25/02/2025.
//

import Foundation

class ClotheDetailViewModel: ObservableObject {
    
    @Published var clothe: Clothe
    
    init(clothe: Clothe) {
        self.clothe = clothe
    }
        
}
