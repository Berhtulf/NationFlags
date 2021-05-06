//
//  CircleImage.swift
//  DemoApp
//
//  Created by Martin Václavík on 25/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var image: Image?
    
    var body: some View {
        image?
            .resizable()
            .cornerRadius(4)
            .shadow(color: Color("CustomShadow"), radius: 5)
            .aspectRatio(contentMode: .fit)
    }
}

struct NationDetailFlag: View{
    @Binding var nation: Nation
    
    var body: some View {
        nation.image
            .resizable()
            .cornerRadius(4)
            .shadow(color: Color("CustomShadow"), radius: 5)
            .aspectRatio(contentMode: .fit)
    }
}
