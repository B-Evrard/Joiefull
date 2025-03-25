//
//  ClotheRowParam.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//



import SwiftUI

protocol DisplayParam {
 
    // MARK: Common
    static var isIpad: Bool { get }
    
    static var pictureWidth: CGFloat { get }
    static var pictureHeight: CGFloat { get }

    static var heartWidth: CGFloat { get }
    static var heartHeight: CGFloat { get }
    
    // MARK: Detail
    static var isDetail: Bool { get }
    static var starNotationWidth: CGFloat { get }
    static var starNotationHeight: CGFloat { get }
    static var commentHeight: CGFloat { get }
    
    // MARK: Fonts 
    static var infosFont: Font { get }
    static var heartFont: Font { get }
    static var descriptionFont: Font { get }
}



