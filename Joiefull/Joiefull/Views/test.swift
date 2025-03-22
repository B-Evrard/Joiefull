//
//  test.swift
//  Joiefull
//
//  Created by Bruno Evrard on 20/03/2025.
//

import SwiftUI

struct test: View {
    let clotheDisplay: ClotheDisplay
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 25 , height: 25 )
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
        }
        .background(Color.red)
        .cornerRadius(50)
        
        Text("Phrase de test")
            .limitedDynamicTypeSize()
        
        //DescriptionView(clotheDisplay: clotheDisplay)
        
    }
}

#Preview {
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
    test(clotheDisplay: clotheDisplay)

    //test()
}
