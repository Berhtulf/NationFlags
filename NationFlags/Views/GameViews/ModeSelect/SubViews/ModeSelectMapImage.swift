//
//  ModeSelectMapImage.swift
//  Countries
//
//  Created by Martin Václavík on 06/01/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ModeSelectMapImage: View {
    @EnvironmentObject private var viewModel: GameModeViewModel

    var body: some View {
        VStack {
            Image(viewModel.settings.imgName)
                .resizable()
                .shadow(radius: 2)
                .aspectRatio(contentMode: .fit)
                .padding(15)
        }
    }
}

#Preview {
    ModeSelectMapImage()
        .environmentObject(GameModeViewModel())
        .environment(\.locale, Locale(identifier: "cs"))
}
