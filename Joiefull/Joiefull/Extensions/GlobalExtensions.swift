//
//  GlobalExtensions.swift
//  Joiefull
//
//  Created by Bruno Evrard on 17/02/2025.
//

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

    func limitedDynamicTypeSize(upTo size: DynamicTypeSize = .accessibility2) -> some View {
        self.dynamicTypeSize(...DynamicTypeSize.accessibility2)
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

// MARK: DynamicTypeSize Extensions
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
                return 1.8 //2.0
            case .accessibility4:
                return 1.8 //2.2
            case .accessibility5:
                return 1.8 //2.4
            @unknown default:
                return 1.0
            }
        }
        else    {
            return 1.0
        }
    }
}
