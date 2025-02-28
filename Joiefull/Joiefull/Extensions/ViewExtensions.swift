//
//  ViewExtensions.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func tappable(_ isTappable: Bool, action: @escaping () -> Void) -> some View {
        if isTappable {
            self.onTapGesture {
                action()
            }
        } else {
            self
        }
    }
    
}


