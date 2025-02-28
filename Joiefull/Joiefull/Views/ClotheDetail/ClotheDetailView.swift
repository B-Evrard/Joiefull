//
//  ClotheDetailView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/02/2025.
//

import SwiftUI

struct ClotheDetailView: View {
    
    @ObservedObject var viewModel: ClotheDetailViewModel
    let param: DisplayParam.Type
    
    var body: some View {
        VStack {
            
            PictureView(
                clothe: viewModel.clothe,
                pictureWidth: param.pictureWidth,
                pictureHeight: param.pictureHeight,
                notationWidth: param.notationWidth,
                notationHeight: param.notationHeight,
                fontSizeNotation: param.fontSizeNotation,
                heartWidth: param.heartWidth,
                heartHeight: param.heartHeight,
                isDetail: true
            )
            .padding(.bottom, 10)
            
            InfosView(
                clothe: viewModel.clothe ,
                fontSize: DisplayParamFactory.clotheDetailParam.fontSize,
                starWidth: DisplayParamFactory.clotheDetailParam.starWidth,
                starHeight: DisplayParamFactory.clotheDetailParam.starHeight
            )
            .padding(.bottom, 10)
            
            DescriptionView(
                clothe: viewModel.clothe,
                fontSize: DisplayParamFactory.clotheDetailParam.fontSizeDescription,
                starWidth: DisplayParamFactory.clotheDetailParam.starWidth,
                starHeight: DisplayParamFactory.clotheDetailParam.starHeight
            )
            .padding(.bottom, 20)
            
            RatingAndNoteView(
                user: User.mock,
                rating: $viewModel.clothe.rating,
                comment: $viewModel.clothe.comment,
                fontSize: DisplayParamFactory.clotheDetailParam.fontSizeDescription,
                starNotationWidth: DisplayParamFactory.clotheDetailParam.starNotationWidth,
                starNotationHeight: DisplayParamFactory.clotheDetailParam.starNotationHeight
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .frame(width: DisplayParamFactory.clotheDetailParam.pictureWidth)
        
    }
        
}

#Preview {
    
    let category: ClotheCategory = .bottoms
    let clothe = Clothe(
        id: 1,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), name: "Jean pour femme",
        category: category,
        likes: 100,
        price: 44.99,
        original_price: 59.99
    )
    
    let viewModel=ClotheDetailViewModel(clothe: clothe)
    
    ClotheDetailView(viewModel: viewModel,param: DisplayParamFactory.clotheDetailParam)
}


