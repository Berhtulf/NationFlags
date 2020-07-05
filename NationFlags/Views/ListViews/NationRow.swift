//
//  NationRow.swift
//  DemoApp
//
//  Created by Martin Václavík on 26/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NationRow: View {
    var nation: Nation
    var body: some View {
        HStack{
            nation.image
                .resizable()
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.init("DarkWhite"), lineWidth: 1)
            )
                .clipped()
                .shadow(radius: 4)
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height: 70)
                .padding(.horizontal)
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text(LocalizedStringKey(nation.name))
                        .multilineTextAlignment(.leading)
                    Text(LocalizedStringKey(nation.capital))
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            Spacer()
            
        }
    }
}

struct NationRow_Previews: PreviewProvider {
    static var previews: some View {
        List{
            NationRow(nation: restNation.randomElement()!)
            NationRow(nation: restNation.randomElement()!)
            NationRow(nation: restNation.randomElement()!)
        }
    }
}
