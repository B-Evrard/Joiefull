//
//  ClotheRowPhoneView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowPhoneView: View {
    
    let clothe: Clothe
    
    var body: some View {
        ClotheRowView(clothe: clothe, pictureWidth: 198, pictureHeight: 198, fontSize: 14, starWidth: 12, starHeight: 12)
    }
    
}
