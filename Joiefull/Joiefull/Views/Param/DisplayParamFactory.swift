//
//  DisplayParamFactory.swift
//  Joiefull
//
//  Created by Bruno Evrard on 27/02/2025.
//

import UIKit

class DisplayParamFactory {
    static var clotheRowParam: DisplayParam.Type {
        return UIDevice.current.userInterfaceIdiom == .pad ? ClotheRowParamIpad.self : ClotheRowParamPhone.self
    }
    
    static var clotheDetailParam: DisplayParam.Type {
        return UIDevice.current.userInterfaceIdiom == .pad ? ClotheDetailParamIpad.self : ClotheDetailParamPhone.self
    }
}
