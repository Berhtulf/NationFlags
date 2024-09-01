//
//  GameModeRowView.swift
//  NationFlags
//
//  Created by Martin Václavík on 06.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

struct GameModeRowView: View {
    var title: LocalizedStringKey
    var score: Int?
    var practice: Bool?

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading)
            Spacer()
            if let score {
                Text(String(score))
                    .font(.callout)
            }
            Image(systemName: practice == true ? "briefcase.fill" : "rosette")
        }
    }
}

#Preview {
    VStack {
        GameModeRowView(title: "Test")
        GameModeRowView(title: "Test", score: 100)
        GameModeRowView(title: "Test", practice: true)
    }.padding()
}
