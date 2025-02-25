//
//  ClotheDetailPhoneView 2.swift
//  Joiefull
//
//  Created by Bruno Evrard on 25/02/2025.
//


//
//  ClotheDetailView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/02/2025.
//

import SwiftUI

struct ClotheDetailIpadView: View {
    
    @ObservedObject var viewModel: ClotheDetailViewModel
    
    var body: some View {
        ClotheDetailView(viewModel: viewModel, param: ClotheDetailParamIpad.self)
    }
    
}
