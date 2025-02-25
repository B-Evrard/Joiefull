//
//  RatingAndNoteView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI

struct RatingAndNoteView: View {
    
    let user: User
    @Binding var rating: Int
    @Binding var comment: String
    
    let fontSize: CGFloat
    let starNotationWidth: CGFloat
    let starNotationHeight: CGFloat
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack(spacing: 20){
                Image(User.mock.profilePicture)
                    .resizable()
                    .frame(width: 42.91, height: 39)
                    .clipShape(Circle())
                
                RatingView(rating: $rating,starNotationWidth: starNotationWidth ,starNotationHeight: starNotationHeight)
                
                
            }
            
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $comment)
                    .frame(height: 50)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .font(.system(size: fontSize))
                
                if (comment.isEmpty) {
                    Text("Partagez ici vos impressions sur cette pièce")
                        .foregroundColor(Color(.systemGray2))
                        .padding(.top, 15)
                        .padding(.leading, 15)
                        .opacity(50)
                        .font(.system(size: fontSize))
                        .allowsHitTesting(false)
                }
            }
            
        }
    }
}

#Preview {
    
    // RatingAndNoteView(user: User.mock)
}
