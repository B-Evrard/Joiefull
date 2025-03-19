//
//  JoiefullApp.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

@main
struct JoiefullApp: App {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    private var clotheRepository = ClotheRepository()
    
    var body: some Scene {
        WindowGroup {
            CatalogView(
                viewModel: CatalogViewModel(repository: clotheRepository)
            )
        }
    }
}
