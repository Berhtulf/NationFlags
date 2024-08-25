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
                .clipped()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height: 70)
                .shadow(color: Color("DarkWhite"), radius: 5)
                .padding(.trailing)
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
            NationRow(nation: Nation.list.randomElement()!)
            NationRow(nation: Nation.list.randomElement()!)
            NationRow(nation: Nation.list.randomElement()!)
            NationRow(nation: Nation.list.randomElement()!)
            NationRow(nation: Nation.list.randomElement()!)
            NationRow(nation: Nation.list.randomElement()!)
            NationRow(nation: Nation.czechRepublic)
            NationRow(nation: Nation.nepal)
        }.preferredColorScheme(.dark)
    }
}
