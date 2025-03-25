//
//  MockClotheNoteStorage.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/03/2025.
//

extension ClotheNoteStorageService {
    func clearAllNotes() {
        self.notes = [:]
        self.saveNotes()
    }
}
