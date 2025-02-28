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
                                    message: Text("Regarde ce vêtement !")
                                ) {
                                    Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(Color.black)
                                                    
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
                Color.black.ignoresSafeArea()
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
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

