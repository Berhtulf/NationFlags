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
            .frame(width: 150, height: 100)
    }
}
struct GameCorrectFlag: View {
    var image: Image?
    var body: some View {
        ZStack {
            GameFlagImage(image: image)
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.green)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
        }
    }
}
struct ShowCorrectFlag: View {
    var nation: Nation
    var body: some View {
        Group {
            if nation.name == "Nepal" {
                Image("np_correct")
                    .resizable()
                    .cornerRadius(4)
                    .shadow(color: Color("CustomShadow"), radius: 4)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 100)
            } else {
                Image(nation.alpha2Code.lowercased())
                    .resizable()
                    .cornerRadius(4)
                    .shadow(color: Color("CustomShadow"), radius: 4)
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.green, lineWidth: 6)
                    )
                    .frame(width: 150, height: 100)
            }
        }
    }
}
struct GameWrongFlag: View {
    var image: Image?
    var body: some View {
        ZStack {
            GameFlagImage(image: image)
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
        }
    }
}

#Preview {
    Group {
        HStack {
            GameFlagImage(image: Image("np")).padding()
            GameFlagImage(image: Image("va")).padding()
            GameFlagImage(image: Image("cz")).padding()
        }
        .previewLayout(.sizeThatFits)
        HStack {
            GameCorrectFlag(image: Image("np")).padding()
            GameCorrectFlag(image: Image("va")).padding()
            GameCorrectFlag(image: Image("cz")).padding()
        }
        .previewLayout(.sizeThatFits)
        HStack {
            GameWrongFlag(image: Image("np")).padding()
            GameWrongFlag(image: Image("va")).padding()
            GameWrongFlag(image: Image("cz")).padding()
        }
        .previewLayout(.sizeThatFits)
    }
}
