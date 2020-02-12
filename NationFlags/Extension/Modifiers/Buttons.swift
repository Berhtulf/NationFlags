//
//  Modifiers.swift
//  Countries
//
//  Created by Martin Václavík on 04/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI
struct BasicButton: ViewModifier {
    var color:Color
    func body(content: Content) -> some View{
        content
            .foregroundColor(Color.primary)
            .lineLimit(1)
            .allowsTightening(true)
            .minimumScaleFactor(0.005)
            .frame(width: 200, height: 40)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(50)
            .padding(.vertical,6)
            .shadow(radius: 3)
    }
}
struct GameButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .modifier(BasicButton(color: Color("SystemGray3")))
    }
}
struct CorrectButton: ViewModifier {
    func body(content: Content) -> some View{
        content
            .modifier(BasicButton(color: Color.green))
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
            .modifier(BasicButton(color: Color("SystemGray3")))
    }
}

struct SmallGameModeButton: ViewModifier{
    func body(content: Content) -> some View{
        content
        .foregroundColor(Color.primary)
        .lineLimit(1)
        .allowsTightening(true)
        .minimumScaleFactor(0.001)
        .frame(width: 120, height: 50)
        .padding(.horizontal)
        .background(Color.init("SystemGray3"))
        .cornerRadius(50)
        .padding(.vertical,7)
    }
}

struct Modifier_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Text("Svatý Tomáš a Princův ostrov")
                .modifier(GameButton())
                .padding(5)
                .previewLayout(.sizeThatFits)
            Text("Dominikánská republika Kongo")
                .modifier(CorrectButton())
                .padding(5)
                .previewLayout(.sizeThatFits)
            Text("Čad")
                .modifier(WrongButton())
                .padding(5)
                .previewLayout(.sizeThatFits)
            Text("MainMenuButton")
                .modifier(MainMenuButton())
                .padding(5)
                .previewLayout(.sizeThatFits)
            Text("SmallGame ModeButton")
                .modifier(SmallGameModeButton())
                .padding(5)
                .previewLayout(.sizeThatFits)
        }
    }
}
