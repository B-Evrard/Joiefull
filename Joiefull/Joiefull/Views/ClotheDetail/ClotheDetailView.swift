//
//  ClotheDetailView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/02/2025.
//

import SwiftUI

struct ClotheDetailView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @ObservedObject var viewModel: ClotheDetailViewModel
    let param: DisplayParam.Type
    
    var body: some View {
        ZStack {
            ScrollView {
                
                VStack {
                    ZStack (alignment: .topTrailing) {
                        VStack {
                            PictureView(
                                clothe: $viewModel.clothe,
                                displayParam: param
                            )
                            .padding(.bottom, 10)
                            
                            InfosView(
                                clothe: viewModel.clothe ,
                                displayParam: param
                            )
                            .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: param.pictureWidth)
                            .padding(.bottom, 10)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(viewModel.clothe.accessibilityPicture)
                        .accessibilityHint("Toucher 2 fois pour agrandir l'image")
                        
                        ShareLink(
                            item: URL(string: "joiefull://clothe/\(viewModel.clothe.id)")!,
                            message: Text("Regarde ce vêtement !"),
                            preview: SharePreview(
                                viewModel.clothe.name,
                                image: Image("Icon")
                            )
                        ) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .accessibilityScaledFrame(
                                    dynamicTypeSize: dynamicTypeSize,
                                    width: 18 ,
                                    height: 25
                                )
                                .foregroundColor(Color.black)
                                .padding()
                                .background(Circle().fill(Color.white).opacity(0.5))
                                .shadow(radius: 3)
                        }
                        .padding(10)
                        .accessibilityLabel("Partager l'article")
                    }
                    
                    DescriptionView(clothe: viewModel.clothe)
                        .padding(.bottom, 20)
                    
                    RatingAndNoteView(
                        user: User.mock,
                        viewModel: viewModel
                    )
                   
                    
                }
                .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: param.pictureWidth+1)
                
            }
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
        original_price: 59.99,
        clotheNote: clotheNote
    )
    
    let viewModel=ClotheDetailViewModel(clothe: clothe)
    
    ClotheDetailView(viewModel: viewModel,param: DisplayParamFactory.clotheDetailParam)
}


