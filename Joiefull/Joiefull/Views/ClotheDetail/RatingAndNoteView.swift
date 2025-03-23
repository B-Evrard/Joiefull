//
//  RatingAndNoteView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI

struct RatingAndNoteView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let user: User
    @ObservedObject var viewModel: ClotheDetailViewModel
    @State private var isEditing: Bool = false
    var body: some View {
        VStack (spacing: 20) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    Image(User.mock.profilePicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 42.91 * dynamicTypeSize.scaleFactor ,
                               height: 39 * dynamicTypeSize.scaleFactor
                        )
                        .clipShape(Circle())
                        .clipped()
                    
                    RatingView(
                        clotheNote: $viewModel.clotheDisplay.clotheNote,
                        starNotationWidth: DisplayParamFactory.clotheDetailParam.starNotationWidth ,
                        starNotationHeight: DisplayParamFactory.clotheDetailParam.starNotationHeight
                    )
                    
                    Spacer()
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(viewModel.clotheDisplay.accessibilityRatingInfos)
            }
            ZStack(alignment: .topLeading) {
                TextEditor(text: $viewModel.clotheDisplay.clotheNote.comment)
                    .frame(height: DisplayParamFactory.clotheDetailParam.commentHeight)
                    .padding(8)
                    .scrollContentBackground(.hidden)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth:1.5)
                        
                    )
                    .font(DisplayParamFactory.clotheDetailParam.descriptionFont)
                    .limitedDynamicTypeSize()
                
                
                if (viewModel.clotheDisplay.clotheNote.comment.isEmpty) {
                    Text("Partagez ici vos impressions sur cette pièce")
                        .foregroundColor(Color(.systemGray2))
                        .padding(.top, 15)
                        .padding(.leading, 15)
                        .opacity(50)
                        .allowsHitTesting(false)
                        .font(DisplayParamFactory.clotheDetailParam.descriptionFont)
                        .limitedDynamicTypeSize()
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(viewModel.clotheDisplay.accessibilityComment)
        }
    }
}

#Preview {
    let category: ClotheCategory = .bottoms
    let clotheNote = ClotheNote(id: 1, rating: 0, comment: "", favorite: false)
    let clothe = Clothe(
        id: 1,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), name: "Jean pour femme",
        category: category,
        likes: 100,
        price: 44.99,
        original_price: 59.99
    )
    
    let viewModel=ClotheDetailViewModel(repository: ClotheRepository(), clotheDisplay: clothe.toDisplayModel(clotheNote: nil) )
    
    RatingAndNoteView(user: User.mock,viewModel: viewModel)
    
}

