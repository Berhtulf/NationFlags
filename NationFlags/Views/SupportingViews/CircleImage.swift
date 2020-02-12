//
//  CircleImage.swift
//  DemoApp
//
//  Created by Martin Václavík on 25/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
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

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CircleImage(image: Image("np"))
        }
    }
}
