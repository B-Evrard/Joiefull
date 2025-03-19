//
//  ClotheNoteStorage.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/03/2025.
//


protocol ClotheNoteStorage {
    func getNote(for clotheID: Int) -> ClotheNote
    func updateNote(for clotheID: Int, rating: Int, comment: String, favorite: Bool)
}