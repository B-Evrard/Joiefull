//
//  accessibilityUtils.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/03/2025.
//

import Foundation
import UIKit

func adjustedSize(for initialSize: CGFloat) -> CGFloat {
    let scaleFactor = UIFontMetrics.default.scaledValue(for: initialSize)
    return scaleFactor
}

func calculMaxWidthCatalog(_ catalogWidth: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    return screenWidth - calculMaxWidthDetail(catalogWidth)
}

func calculMaxWidthDetail(_ catalogWidth: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let maxDetail = screenWidth * 0.72
    let detailWidth = screenWidth - catalogWidth
    var adjustedDetail = adjustedSize(for: detailWidth)
    if (adjustedDetail > maxDetail)
    {
        adjustedDetail = maxDetail
    }
    return adjustedDetail
}


