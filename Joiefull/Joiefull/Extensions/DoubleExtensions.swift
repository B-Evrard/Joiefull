//
//  DoubleExtensions.swift
//  Joiefull
//
//  Created by Bruno Evrard on 17/02/2025.
//

import Foundation

extension Double {
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = self.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
        formatter.maximumFractionDigits = 2

        return (formatter.string(from: NSNumber(value: self)) ?? "\(self)") + " €"
    }
}
