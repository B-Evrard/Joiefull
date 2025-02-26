//
//  ViewExtensions.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import Foundation
import SwiftUI

extension View {
    func placeholder <Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder builder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            builder()
                .opacity(shouldShow ? 1 : 0)
            
            self
        }
    }
}
