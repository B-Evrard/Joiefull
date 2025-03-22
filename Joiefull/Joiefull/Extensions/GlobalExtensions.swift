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
    
//    func accessibilityScaledFrame(dynamicTypeSize: DynamicTypeSize, width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center ) -> some View {
//        let screenWidth = UIScreen.main.bounds.width-30
//        let scaledWidth = width.map { adjustedSize(for: $0) }
//        var limitedWidth = scaledWidth
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            let maxWidth = calculMaxWidthDetail(694)
//            limitedWidth = scaledWidth != nil ? min(scaledWidth!, maxWidth) : nil
//        }
//        else {
//            limitedWidth = scaledWidth != nil ? min(scaledWidth!, screenWidth) : nil
//        }
//       
//        let scaledHeight = height.map { adjustedSize(for: $0) }
//        return self.frame(width: limitedWidth, height: scaledHeight, alignment: alignment)
//    }
    
//    func accessibilityScaledFont(size: CGFloat, semiBold: Bool = false) -> some View {
//        let font = semiBold ? "SFProText-Semibold" : "SFProText-Regular"
//        return self.font(Font.custom(font, size: size, relativeTo: .body)).limitedDynamicTypeSize()
//    }
//    
    func limitedDynamicTypeSize(upTo size: DynamicTypeSize = .accessibility2) -> some View {
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


extension DynamicTypeSize {
    
    var scaleFactor: CGFloat {
        if (self.isAccessibilitySize)   {
            switch self {
            case .xSmall:
                return 0.8
            case .small:
                return 0.9
            case .medium:
                return 1.0
            case .large:
                return 1.1
            case .xLarge:
                return 1.2
            case .xxLarge:
                return 1.3
            case .xxxLarge:
                return 1.4
            case .accessibility1:
                return 1.6
            case .accessibility2:
                return 1.8
            case .accessibility3:
                return 2.0
            case .accessibility4:
                return 2.2
            case .accessibility5:
                return 2.4
            @unknown default:
                return 1.0
            }
        }
        else    {
            print ("NOP")
            return 1.0
        }
        
        
    }
    
    
}
