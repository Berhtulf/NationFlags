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
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color("DarkWhite"), lineWidth: 1)
            )
            .clipped()
            .shadow(radius: 4)
            .aspectRatio(contentMode: .fit)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(image: Image("np"))
    }
}
