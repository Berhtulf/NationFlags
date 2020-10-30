//
//  SmallWidgetView.swift
//  NationFlags
//
//  Created by Martin Václavík on 30/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    let entry: NationEntry
    
    var body: some View {
        VStack{
            Text(LocalizedStringKey(entry.nation.name))
                .font(.headline)
            Text(LocalizedStringKey(entry.nation.capital))
                .font(.caption)
            Spacer()
            FlagImage(image: entry.nation.image)
                .scaledToFit()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}


