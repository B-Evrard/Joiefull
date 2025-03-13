//
//  accessibilityUtils.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/03/2025.
//

import Foundation
import UIKit

func adjustedSize(for initialSize: CGFloat) -> CGFloat {
    let scaleFactor = UIFontMetrics.default.scaledValue(for: initialSize) / initialSize
    return initialSize * scaleFactor
}
