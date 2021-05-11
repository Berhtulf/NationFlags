//
//  OptionButtonStyle.swift
//  NationFlags
//
//  Created by Martin Václavík on 04.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

struct OptionButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    private(set) var wasPressed: Bool
    private(set) var isCorrect: Bool
    private(set) var showCorrect = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.primary)
            .multilineTextAlignment(.center)
            .frame(minWidth: 140, maxWidth: 170, minHeight: 20, maxHeight: 50)
            .padding(.horizontal)
            .padding(.vertical, 2)
            .background(getBackgroundColor())
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(showCorrect && isCorrect ? Color.green : Color.white.opacity(0), lineWidth: 2)
            )
            .cornerRadius(10)
            .padding(.vertical, 5)
            .shadow(radius: 2, y: 2)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
    
    func getBackgroundColor() -> Color {
        if (!wasPressed || isEnabled) {
            return Color("CustomGray")
        }else{
            return isCorrect ? Color.green : .red
        }
    }
}

struct OptionButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button", action: {})
            .buttonStyle(OptionButtonStyle(wasPressed: false, isCorrect: false))
            .preferredColorScheme(.dark)
    }
}
