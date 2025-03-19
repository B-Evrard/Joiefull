//
//  MockClotheNoteStorage.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/03/2025.
//


//class MockClotheNoteStorage: ClotheNoteStorage {
//    var notes: [Int: ClotheNote] = [:]
//    
//    func getNote(for clotheID: Int) -> ClotheNote {
//        return notes[clotheID] ?? ClotheNote(id: clotheID, rating: 0, comment: "", favorite: false)
//    }
//    
//    func updateNote(for clotheID: Int, rating: Int, comment: String, favorite: Bool) {
//        notes[clotheID] = ClotheNote(id: clotheID, rating: rating, comment: comment, favorite: favorite)
//    }
//    
//    func reset() {
//        notes = [:]
//    }
//    
//    func setupTestData() {
//        notes[1] = ClotheNote(id: 1, rating: 4, comment: "Test comment", favorite: true)
//        notes[2] = ClotheNote(id: 2, rating: 2, comment: "Another test", favorite: false)
//    }
//}

extension ClotheNoteStorageService {
    func clearAllNotes() {
        self.notes = [:]
        self.saveNotes()
    }
}
