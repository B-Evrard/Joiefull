//
//  Clothe+Display.swift
//  Joiefull
//
//  Created by Bruno Evrard on 17/03/2025.
//

import Foundation

extension Clothe {
    func toDisplayModel(clotheNote: ClotheNote?) -> ClotheDisplay {
        return ClotheDisplay(
            id: self.id,
            clothe: self,
            clotheNote: clotheNote ?? ClotheNote(id:self.id, rating:0, comment: "", favorite: false)
        )
    }
}
