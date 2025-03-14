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
    
    func accessibilityScaledFrame(dynamicTypeSize: DynamicTypeSize, width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center ) -> some View {
        let screenWidth = UIScreen.main.bounds.width-30
        let scaledWidth = width.map { adjustedSize(for: $0) }
        let limitedWidth = scaledWidth != nil ? min(scaledWidth!, screenWidth) : nil
        let scaledHeight = height.map { adjustedSize(for: $0) }
        return self.frame(width: limitedWidth, height: scaledHeight, alignment: alignment).limitedDynamicTypeSize()
    }
    
    func accessibilityScaledFont(size: CGFloat, semiBold: Bool = false) -> some View {
        let font = semiBold ? "SFProText-Semibold" : "SFProText-Regular"
        return self.font(Font.custom(font, size: size, relativeTo: .body)).limitedDynamicTypeSize()
    }
    
    func limitedDynamicTypeSize(upTo size: DynamicTypeSize = .accessibility3) -> some View {
            self.dynamicTypeSize(...size)
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
