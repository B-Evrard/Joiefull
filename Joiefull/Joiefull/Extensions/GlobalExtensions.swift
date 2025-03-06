//
//  GlobalExtensions.swift
//  Joiefull
//
//  Created by Bruno Evrard on 17/02/2025.
//

import Foundation
import SwiftUI

// MARK: Views Extensions
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
    
    func accessibilityScaledFrame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        let screenWidth = UIScreen.main.bounds.width-40
        let scaledWidth = width != nil ? width!.scaledFont() : width
        let limitedWidth = scaledWidth != nil ? min(scaledWidth!, screenWidth) : nil
        let scaledHeight = height?.scaledFont()
        return self.frame(width: limitedWidth, height: scaledHeight, alignment: alignment)
    }
    
    func limitedDynamicTypeSize(upTo size: DynamicTypeSize = .small) -> some View {
            self.dynamicTypeSize(...size)
    }

    
}

// MARK: CGFloat Extensions
extension CGFloat {
    func scaledFont(forTextStyle style: UIFont.TextStyle = .body) -> CGFloat {
        return UIFontMetrics.default.scaledValue(for: self, compatibleWith: nil)
    }
}

// MARK: Double Extensions
extension Double {
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = self.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
        formatter.maximumFractionDigits = 2

        return (formatter.string(from: NSNumber(value: self)) ?? "\(self)") + " €"
    }
    
    func formattedRate() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = self.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
        formatter.maximumFractionDigits = 2

        return (formatter.string(from: NSNumber(value: self)) ?? "\(self)") 
    }
}
