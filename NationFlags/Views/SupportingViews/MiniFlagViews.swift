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
            .shadow(color: Color("CustomShadow"), radius: 4)
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
struct ShowCorrectFlag: View {
    var image: Image?
    var body: some View {
        ZStack{
            GameFlagImage(image: image)
                .shadow(color: .green, radius: 5)
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
            HStack{
                GameFlagImage(image: Image("np")).padding()
                GameFlagImage(image: Image("va")).padding()
                GameFlagImage(image: Image("cz")).padding()
            }.previewLayout(.sizeThatFits)
            HStack{
                GameCorrectFlag(image: Image("np")).padding()
                GameCorrectFlag(image: Image("va")).padding()
                GameCorrectFlag(image: Image("cz")).padding()
            }.previewLayout(.sizeThatFits)
            HStack{
                GameWrongFlag(image: Image("np")).padding()
                GameWrongFlag(image: Image("va")).padding()
                GameWrongFlag(image: Image("cz")).padding()
            }.previewLayout(.sizeThatFits)
            HStack{
                ShowCorrectFlag(image: Image("np")).padding()
                ShowCorrectFlag(image: Image("va")).padding()
                ShowCorrectFlag(image: Image("de")).padding()
            }.previewLayout(.sizeThatFits)
        }
    }
}
