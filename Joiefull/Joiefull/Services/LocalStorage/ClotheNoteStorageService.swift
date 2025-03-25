//
//  ClotheNote.swift
//  Joiefull
//
//  Created by Bruno Evrard on 25/02/2025.
//


import Foundation


class ClotheNoteStorageService: ClotheNoteStorage {
    static let shared = ClotheNoteStorageService()
    private let filename: String

    var notes: [Int: ClotheNote] = [:]

    init(filename: String = "clothe_notes.json") {
        self.filename = filename
        loadNotes()
    }

    func getNote(for clotheID: Int) -> ClotheNote {
        return notes[clotheID] ?? ClotheNote(id: clotheID, rating: 0, comment: "", favorite: false)
    }

    func updateNote(for clotheID: Int, rating: Int, comment: String, favorite: Bool) {
        notes[clotheID] = ClotheNote(id: clotheID, rating: rating, comment: comment, favorite: favorite)
        saveNotes()
    }
    
    private func getFileURL() -> URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent(filename)
    }

    private func loadNotes() {
        let fileURL = getFileURL()
        if let data = try? Data(contentsOf: fileURL) {
            if let decoded = try? JSONDecoder().decode([Int: ClotheNote].self, from: data) {
                notes = decoded
            }
        }
    }

    func saveNotes() {
        let fileURL = getFileURL()
        if let encoded = try? JSONEncoder().encode(notes) {
            try? encoded.write(to: fileURL)
        }
    }

    
}
