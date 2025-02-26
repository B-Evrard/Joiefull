//
//  ClotheRowIpadView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowIpadView: View {

    let clothe: Clothe

    
    var body: some View {
        ClotheRowView(clothe: clothe, param: ClotheRowParamIpad.self)
    }
}
