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
    var body: some Scene {
        WindowGroup {
            CatalogView(viewModel: CatalogViewModel(apiService: APIClient()))
        }
    }
}
