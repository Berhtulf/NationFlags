//
//  GameCorrectFlag.swift
//  Countries
//
//  Created by Martin Václavík on 18/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI
struct GameFlagImage: View {
    var image: Image?
    var body: some View {
        image?
            .resizable()
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.init("DarkWhite"), lineWidth: 1)
        )
            .clipped()
            .shadow(radius: 4)
            .aspectRatio(contentMode: .fit)
            .frame(width:150, height: 100)
    }
}
struct GameCorrectFlag: View {
    var image: Image?
    var body: some View {
        ZStack{
            GameFlagImage(image: image)
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width:60, height: 60)
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width:60, height: 60)
                .foregroundColor(.green)
                .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                )
        }
    }
}
struct GameWrongFlag: View {
    var image: Image?
    var body: some View {
        ZStack{
                GameFlagImage(image: image)
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width:60, height: 60)
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width:60, height: 60)
                    .foregroundColor(.red)
                    .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }

struct GameCorrectFlag_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GameFlagImage(image: Image("de")).padding(50).previewLayout(.sizeThatFits)
            GameCorrectFlag(image: Image("de")).padding(50).previewLayout(.sizeThatFits)
            GameWrongFlag(image: Image("va")).padding(50).previewLayout(.sizeThatFits)
        }
    }
}
