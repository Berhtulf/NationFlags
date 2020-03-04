//
//  Modifiers.swift
//  Countries
//
//  Created by Martin Václavík on 04/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct BasicButton: ViewModifier {
    var color:Color = Color("CustomGray")
    func body(content: Content) -> some View{
        content
            .foregroundColor(Color.primary)
            .lineLimit(1)
            .allowsTightening(true)
            .minimumScaleFactor(0.005)
            .frame(minWidth: 140, maxWidth: 170, minHeight: 20, maxHeight: 50)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(10)
            .padding(.vertical,6)
            .shadow(radius: 3, y: 3)
    }
}
struct CorrectButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .modifier(BasicButton(color: Color.green))
    }
}
struct ShowCorrectButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .foregroundColor(Color.primary)
            .lineLimit(1)
            .allowsTightening(true)
            .minimumScaleFactor(0.005)
            .frame(minWidth: 140, maxWidth: 170, minHeight: 20, maxHeight: 50)
            .padding(.horizontal)
            .background(Color("CustomGray"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 2)
            )
            .padding(.vertical,6)
            .shadow(radius: 3, y: 3)
            
    }
}
struct WrongButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .modifier(BasicButton(color: Color.red))
    }
}

struct MainMenuButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .modifier(BasicButton(color: Color("CustomGray")))
    }
}

struct BlueMenuButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .foregroundColor(Color.white)
            .lineLimit(1)
            .allowsTightening(true)
            .minimumScaleFactor(0.005)
            .frame(minWidth: 140, maxWidth: 170, minHeight: 20, maxHeight: 50)
            .padding(.horizontal)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.vertical,6)
            .shadow(radius: 3, y: 3)
    }
}