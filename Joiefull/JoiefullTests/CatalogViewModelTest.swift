//
//  CatalogViewModelTest.swift
//  JoiefullTests
//
//  Created by Bruno Evrard on 07/03/2025.
//

import XCTest

final class CatalogViewModelTest: XCTestCase {

    func testSuccess() async {
        let session = MockUrlSession()
        session.data = sampleJSON.data(using: .utf8)
        session.urlResponse = HTTPURLResponse(url: Endpoint.clothes.api , statusCode: 200, httpVersion: nil, headerFields: nil)
        let mockApiClient = MockApiClient(session: session)
        let mockStorage = ClotheNoteStorageService(filename: "test.clothe_notes.json")
        let repository = ClotheRepository(apiService: mockApiClient, localStorage: mockStorage)
        let viewModel = CatalogViewModel(repository: repository)
        await viewModel.fetchClothes()
        
        XCTAssertEqual(viewModel.clothesCategory.count, 4)
        XCTAssertEqual(viewModel.clothesCategory.values.flatMap { $0 }.count, 12)
        
        mockStorage.clearAllNotes()
        
    }
    
    func testFilter() async {
        let session = MockUrlSession()
        session.data = sampleJSON.data(using: .utf8)
        session.urlResponse = HTTPURLResponse(url: Endpoint.clothes.api , statusCode: 200, httpVersion: nil, headerFields: nil)
        let mockApiClient = MockApiClient(session: session)
        let mockStorage = ClotheNoteStorageService(filename: "test.clothe_notes.json")
        let repository = ClotheRepository(apiService: mockApiClient, localStorage: mockStorage )
        let viewModel = CatalogViewModel(repository: repository)
        
        viewModel.search = "Sac à main"
        await viewModel.fetchClothes()
        
        XCTAssertEqual(viewModel.clothesCategory.count, 1)
        XCTAssertEqual(viewModel.clothesCategory.values.flatMap { $0 }.count, 1)
        
        viewModel.search = "zzzzzzzzzzzz"
        await viewModel.fetchClothes()
        
        XCTAssertEqual(viewModel.clothesCategory.count, 0)
        
        mockStorage.clearAllNotes()
    }
    
    func testError() async {
        let session = MockUrlSession()
        session.data = invalidJson.data(using: .utf8)
        session.urlResponse = HTTPURLResponse(url: Endpoint.clothes.api , statusCode: 200, httpVersion: nil, headerFields: nil)
     
        let mockApiClient = MockApiClient(session: session)
        let mockStorage = ClotheNoteStorageService(filename: "test.clothe_notes.json")
        let repository = ClotheRepository(apiService: mockApiClient, localStorage: mockStorage )
        let viewModel = CatalogViewModel(repository: repository)
        
        await viewModel.fetchClothes()
        
        XCTAssertEqual(viewModel.showAlert,true)
        
        mockStorage.clearAllNotes()
    }
    
}

let invalidJson = """
xxxxxx
"""

let sampleJSON = """
[
  {
    "id": 0,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/accessories/1.jpg",
      "description": "Sac à main orange posé sur une poignée de porte"
    },
    "name": "Sac à main orange",
    "category": "ACCESSORIES",
    "likes": 56,
    "price": 69.99,
    "original_price": 69.99
  },
  {
    "id": 1,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg",
      "description": "Modèle femme qui porte un jean et un haut jaune"
    },
    "name": "Jean pour femme",
    "category": "BOTTOMS",
    "likes": 55,
    "price": 49.99,
    "original_price": 59.99
  },
  {
    "id": 2,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/shoes/1.jpg",
      "description": "Modèle femme qui pose dans la rue en bottes de pluie noires"
    },
    "name": "Bottes noires pour l'automne",
    "category": "SHOES",
    "likes": 4,
    "price": 99.99,
    "original_price": 119.99
  },
  {
    "id": 3,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/1.jpg",
      "description": "Homme en costume et veste de blazer qui regarde la caméra"
    },
    "name": "Blazer marron",
    "category": "TOPS",
    "likes": 15,
    "price": 79.99,
    "original_price": 79.99
  },
  {
    "id": 4,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/2.jpg",
      "description": "Femme dehors qui pose avec un pull en maille vert"
    },
    "name": "Pull vert femme",
    "category": "TOPS",
    "likes": 15,
    "price": 29.99,
    "original_price": 39.99
  },
  {
    "id": 5,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/shoes/2.jpg",
      "description": "Escarpins rouges posés sur du marbre"
    },
    "name": "Escarpins de soirée",
    "category": "SHOES",
    "likes": 15,
    "price": 139.99,
    "original_price": 139.99
  },
  {
    "id": 6,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/accessories/2.jpg",
      "description": "Sac d'aventurier usé accroché dans un arbre en forêt"
    },
    "name": "Sac à dos d'aventurier",
    "category": "ACCESSORIES",
    "likes": 9,
    "price": 69.99,
    "original_price": 99.99
  },
  {
    "id": 7,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/3.jpg",
      "description": "Homme jeune stylé en jean et bomber qui pose dans la rue"
    },
    "name": "Bomber automnal pour homme",
    "category": "TOPS",
    "likes": 30,
    "price": 89.99,
    "original_price": 109.99
  },
  {
    "id": 8,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/4.jpg",
      "description": "Homme en sweat jaune qui regarde à droite"
    },
    "name": "Sweat jaune",
    "category": "TOPS",
    "likes": 6,
    "price": 39.99,
    "original_price": 39.99
  },
  {
    "id": 9,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/5.jpg",
      "description": "T-shirt rose posé sur un cintre dans une penderie"
    },
    "name": "T-shirt casual rose",
    "category": "TOPS",
    "likes": 35,
    "price": 29.99,
    "original_price": 29.99
  },
  {
    "id": 10,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/accessories/3.jpg",
      "description": "Pendentif rond bleu dans la main d'une femme"
    },
    "name": "Pendentif bleu pour femme",
    "category": "ACCESSORIES",
    "likes": 70,
    "price": 19.99,
    "original_price": 69.99
  },
  {
    "id": 11,
    "picture": {
      "url": "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/2.jpg",
      "description": "Homme en chemise blanche et pantalon noir assis dans la forêt"
    },
    "name": "Pantalon noir",
    "category": "BOTTOMS",
    "likes": 54,
    "price": 49.99,
    "original_price": 69.99
  }
]
"""
