//
//  SearchButton.swift
//  NationFlags
//
//  Created by Martin Václavík on 22/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct SearchButton: View {
    @EnvironmentObject private var model: NationListViewModel

    var body: some View {
        Button(action: {
            withAnimation {
                model.search = ""
                model.showSearch.toggle()
            }
        }) {
            Image(systemName: "magnifyingglass")
                .padding()
        }
    }
}

#Preview {
    SearchButton()
        .padding()
        .previewLayout(.sizeThatFits)
}
