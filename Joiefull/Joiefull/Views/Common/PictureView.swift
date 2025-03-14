//
//  PictureView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import SwiftUI
struct PictureView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @Binding var clothe: Clothe
    let displayParam : DisplayParam.Type
    
    @State private var isShowingFullScreen = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: clothe.picture.url)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .accessibilityScaledFrame(
                            dynamicTypeSize: dynamicTypeSize,
                            width: displayParam.pictureWidth ,
                            height: displayParam.pictureHeight
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .clipped()
                    
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .accessibilityScaledFrame(
                            dynamicTypeSize: dynamicTypeSize,
                            width: displayParam.pictureWidth ,
                            height: displayParam.pictureHeight
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .clipped()
                    
                @unknown default:
                    EmptyView()
                }
            }
            .overlay(
                NotationView(
                    clothe: $clothe,
                    displayParam: displayParam
                ),
                alignment: .bottomTrailing
            )
            
        }
        .sheet(isPresented: $isShowingFullScreen) {
            FullScreenImageView(imageURL: clothe.picture.url, description: clothe.accessibilityDescription)
        }
        
    }
    
    struct FullScreenImageView: View {
        
        @State private var scale: CGFloat = 1.0
        @State private var lastScale: CGFloat = 1.0
        @State private var offset: CGSize = .zero
        @State private var lastOffset: CGSize = .zero
        
        let imageURL: String
        let description: String
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            ZStack {
                Color.white.ignoresSafeArea()
                AsyncImage(url: URL(string: imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale)
                            .offset(offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset = CGSize(
                                            width: lastOffset.width + value.translation.width,
                                            height: lastOffset.height + value.translation.height
                                        )
                                    }
                                    .onEnded { _ in
                                        lastOffset = offset
                                    }
                            )
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        let newScale = lastScale * value
                                        scale = min(max(newScale, 1), 5)
                                    }
                                    .onEnded { _ in
                                        lastScale = scale
                                    }
                            )
                            .onTapGesture(count: 2) {
                                withAnimation {
                                    scale = 1.0
                                    lastScale = 1.0
                                    offset = .zero
                                    lastOffset = .zero
                                }
                            }
                        
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                        
                    @unknown default:
                        EmptyView()
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(description)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    Spacer()
                }
                
            }
        }
    }
}

#Preview {
    let category: ClotheCategory = .bottoms
    let clothe = Clothe(
        id: 1,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), name: "Jean pourjkhkjkjhkhkhkhkjh femme",
        category: category,
        likes: 100,
        price: 44.99,
        original_price: 59.99
    )
    PictureView(
        clothe: .constant(clothe),
        displayParam: DisplayParamFactory.clotheDetailParam
    )
    
}
