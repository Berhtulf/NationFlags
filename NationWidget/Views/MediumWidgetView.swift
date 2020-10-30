//
//  MediumWidgetView.swift
//  NationFlags
//
//  Created by Martin Václavík on 30/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct MediumWidgetView: View {
    let entry: NationEntry
    
    var body: some View {
        VStack(alignment: .center){
            Text(LocalizedStringKey(entry.nation.name))
                .font(.headline)
                .multilineTextAlignment(.center)
            HStack{
                FlagImage(image: entry.nation.image)
                    .scaledToFit()
                Spacer()
                VStack (alignment: .leading, spacing: 5){
                    HStack{
                        Label("\(entry.nation.capital)", systemImage: "house.fill")
                            .allowsTightening(true)
                            .lineLimit(1)
                    }
                    HStack{
                        Label("\(entry.nation.population)", systemImage: "person.2.fill")
                            .allowsTightening(true)
                    }
                }
                .font(.system(size: 15))
                .padding()
            }
        }
        .padding()
    }
}
