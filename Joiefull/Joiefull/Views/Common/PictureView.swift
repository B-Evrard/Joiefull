//
//  PictureView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import SwiftUI
struct PictureView: View {
    
    let clothe: Clothe
    
    let pictureWidth: CGFloat
    let pictureHeight: CGFloat
    let notationWidth: CGFloat
    let notationHeight: CGFloat
    let fontSizeNotation: CGFloat
    let heartWidth: CGFloat
    let heartHeight: CGFloat
    
    let isDetail: Bool
    
    @State private var isShowingFullScreen = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: clothe.picture.url)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    ZStack (alignment: .topTrailing) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: pictureWidth, height: pictureHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .tappable(isDetail) {
                                isShowingFullScreen = true
                            }
                        if isDetail {
                            ShareLink(
                                item: URL(string: "joiefull://clothe/\(clothe.id)")!,
                                    message: Text("Regarde ce vêtement !"),
                                    preview: SharePreview(
                                        clothe.name,
                                            image: image
                                        )
                                ) {
                                    Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: 18, height: 25)
                                    .foregroundColor(Color.black)
                                    .padding()
                                    .background(Circle().fill(Color.white).opacity(0.5))
                                    .shadow(radius: 3)
                                }
                                .padding(10)
                        }
                    }
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: pictureWidth, height: pictureHeight)
                        .foregroundColor(.gray)
                    
                @unknown default:
                    EmptyView()
                }
            }
            .overlay(
                NotationView(
                    likes: clothe.likes,
                    width: notationWidth,
                    height: notationHeight,
                    fontSize: fontSizeNotation,
                    heartWidth: heartWidth,
                    heartHeight: heartHeight
                ),
                alignment: .bottomTrailing
            )
            
        }
        .sheet(isPresented: $isShowingFullScreen) {
            FullScreenImageView(imageURL: clothe.picture.url)
        }
        
    }
    
    struct FullScreenImageView: View {
        
        @State private var scale: CGFloat = 1.0
        @State private var lastScale: CGFloat = 1.0
        @State private var offset: CGSize = .zero
        @State private var lastOffset: CGSize = .zero
        
        let imageURL: String
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
    let param = DisplayParamFactory.self
    
    PictureView(
        clothe: clothe,
        pictureWidth: param.clotheDetailParam.pictureWidth,
        pictureHeight: param.clotheDetailParam.pictureHeight,
        notationWidth: param.clotheDetailParam.notationWidth,
        notationHeight: param.clotheDetailParam.notationHeight,
        fontSizeNotation: param.clotheDetailParam.fontSizeNotation,
        heartWidth: param.clotheDetailParam.heartWidth,
        heartHeight: param.clotheDetailParam.heartHeight,
        isDetail: true
    )
    
}
