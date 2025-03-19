//
//  ClotheDetailViewModelTest.swift
//  JoiefullTests
//
//  Created by Bruno Evrard on 18/03/2025.
//

import XCTest

final class ClotheDetailViewModelTest: XCTestCase {
    
    @MainActor
    func testReadClotheNote() async {
        
        let category: ClotheCategory = .bottoms
        let clothe = Clothe(
            id: 1,
            picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
            name: "Jean pour femme",
            category: category,
            likes: 10,
            price: 10.50,
            original_price: 15
        )
        let clotheDisplay = clothe.toDisplayModel(clotheNote: nil)
        
        XCTAssertEqual(clotheDisplay.id,1)
        XCTAssertEqual(clotheDisplay.clotheNote.id,1)
        XCTAssertEqual(clotheDisplay.clotheNote.rating,0)
        XCTAssertEqual(clotheDisplay.clotheNote.comment,"")
        XCTAssertEqual(clotheDisplay.clotheNote.favorite,false)
        
        let session = MockUrlSession()
        session.data = sampleJSON.data(using: .utf8)
        session.urlResponse = HTTPURLResponse(url: Endpoint.clothes.api , statusCode: 200, httpVersion: nil, headerFields: nil)
        let mockApiClient = MockApiClient(session: session)
        
        let mockStorage = ClotheNoteStorageService(filename: "test.clothe_notes.json")
       
        let repository = ClotheRepository(apiService: mockApiClient, localStorage: mockStorage)
        let viewModel = ClotheDetailViewModel(repository: repository, clotheDisplay: clotheDisplay)
        
        await viewModel.readClotheNote()
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.id,1)
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.rating,0)
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.comment,"")
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.favorite,false)
        
        mockStorage.clearAllNotes()
        
        //ClotheNote(id: 1, rating: 4, comment: "Test comment", favorite: true)
        
    }
    
    @MainActor
    func testSaveClotheNote() async {
     
        let category: ClotheCategory = .bottoms
        let clothe = Clothe(
            id: 10,
            picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
            name: "Jean pour femme",
            category: category,
            likes: 10,
            price: 10.50,
            original_price: 15
        )
        let clotheDisplay = clothe.toDisplayModel(clotheNote: nil)
        
        let session = MockUrlSession()
        session.data = sampleJSON.data(using: .utf8)
        session.urlResponse = HTTPURLResponse(url: Endpoint.clothes.api , statusCode: 200, httpVersion: nil, headerFields: nil)
        let mockApiClient = MockApiClient(session: session)
        
        let mockStorage = ClotheNoteStorageService(filename: "test.clothe_notes.json")
        let repository = ClotheRepository(apiService: mockApiClient, localStorage: mockStorage)
        let viewModel = ClotheDetailViewModel(repository: repository, clotheDisplay: clotheDisplay)
        
        await viewModel.readClotheNote()
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.id,10)
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.rating,0)
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.comment,"")
        XCTAssertEqual(viewModel.clotheDisplay.clotheNote.favorite,false)

        viewModel.clotheDisplay.clotheNote.rating = 5
        viewModel.clotheDisplay.clotheNote.comment = "Super"
        viewModel.clotheDisplay.clotheNote.favorite = true
        
        await viewModel.saveClotheNote()
        
        let clotheDisplayUpdate = clothe.toDisplayModel(clotheNote: nil)
        let viewModelUpdate = ClotheDetailViewModel(repository: repository, clotheDisplay: clotheDisplayUpdate)
        
        await viewModelUpdate.readClotheNote()
        XCTAssertEqual(viewModelUpdate.clotheDisplay.clotheNote.id,10)
        XCTAssertEqual(viewModelUpdate.clotheDisplay.clotheNote.rating,5)
        XCTAssertEqual(viewModelUpdate.clotheDisplay.clotheNote.comment,"Super")
        XCTAssertEqual(viewModelUpdate.clotheDisplay.clotheNote.favorite,true)
        
        mockStorage.clearAllNotes()
    }
    
}
