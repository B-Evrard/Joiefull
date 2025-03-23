//
//  accessibilityUtils.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/03/2025.
//

import Foundation
import SwiftUI

func calculMaxWidthCatalog(catalogWidth: CGFloat, dynamicTypeSize: DynamicTypeSize) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let detailWidth = 430 * dynamicTypeSize.scaleFactor
    
    let cataloggWith = screenWidth - detailWidth
    
    
    //let minCatalogWidth: CGFloat = screenWidth / 3
    //let detailWidth: CGFloat = screenWidth - catalogWidth
    //let detailAdjusted: CGFloat = detailWidth * dynamicTypeSize.scaleFactor
    //let catalogAdjusted: CGFloat = screenWidth - detailAdjusted
    //return max(catalogAdjusted, minCatalogWidth)
    return cataloggWith
}


 


