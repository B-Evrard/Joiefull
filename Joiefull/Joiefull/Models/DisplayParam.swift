//
//  ClotheRowParam.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//


import Foundation

protocol DisplayParam {
 
    // MARK: Common
    static var isIpad: Bool { get }
    
    static var pictureWidth: CGFloat { get }
    static var pictureHeight: CGFloat { get }
    static var starWidth: CGFloat { get }
    static var starHeight: CGFloat { get }
    
    static var notationWidth: CGFloat { get }
    static var notationHeight: CGFloat { get }
    static var heartWidth: CGFloat { get }
    static var heartHeight: CGFloat { get }
    
    // MARK: Row
    static var rowHeight: CGFloat { get }
    
    // MARK: Detail
    static var isDetail: Bool { get }
    static var starNotationWidth: CGFloat { get }
    static var starNotationHeight: CGFloat { get }
    
    // MARK: Fonts Size
    static var infosFontSize: CGFloat { get }
    static var heartFontSize: CGFloat { get }
    static var descriptionFontSize: CGFloat { get }
    
    
    
}



