//
//  FlagButtonStyle.swift
//  NationFlags
//
//  Created by Martin Václavík on 05.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    private(set) var wasPressed: Bool
    private(set) var isCorrect: Bool
    private(set) var showCorrect = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .shadow(color: showCorrect && isCorrect ? Color.green : Color.white.opacity(0), radius: 2, x: 0.0, y: 0.0)
            .overlay(
                ZStack{
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(showCorrect && isCorrect ? Color.green : Color.white.opacity(0), lineWidth: 5)
                    Group{
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
                    }.opacity(wasPressed && isCorrect ? 1 : 0)
                    Group{
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
                    }.opacity(wasPressed && !isCorrect ? 1 : 0)
                }
            )
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
    
    func getBackgroundColor() -> Color {
        if isEnabled || !wasPressed {
            return Color.white
        }else{
            return isCorrect ? Color.green : .red
        }
    }
}

struct FlagButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HStack{
                Button(action: {}, label: {
                    GameFlagImage(image: Nation.czechRepublic.image)
                }).buttonStyle(FlagButtonStyle(wasPressed: false, isCorrect: true, showCorrect: false))
                .disabled(true)
                Button(action: {}, label: {
                    GameFlagImage(image: Nation.nepal.image)
                }).buttonStyle(FlagButtonStyle(wasPressed: true, isCorrect: false, showCorrect: false))
                .disabled(true)
                Button(action: {}, label: {
                    GameFlagImage(image: Nation.nepal.image)
                }).buttonStyle(FlagButtonStyle(wasPressed: false, isCorrect: true, showCorrect: true))
                .disabled(true)
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}
