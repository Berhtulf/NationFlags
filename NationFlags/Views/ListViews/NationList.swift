//
//  NationList.swift
//  DemoApp
//
//  Created by Martin Václavík on 26/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NationList: View {
    @EnvironmentObject var settings: GlobalSettings
    var body: some View {
        VStack{
            if settings.showSearch{
                SearchBar()
                    .padding(.top)
                    .padding(.horizontal)
            }
            List(restNation
                .filter{NSLocalizedString($0.name, comment: "").lowercased().contains(settings.search.lowercased()) || settings.search == "" || NSLocalizedString($0.capital, comment: "").lowercased().contains(settings.search.lowercased())}
                .sorted(by: {NSLocalizedString($0.name, comment: "") < NSLocalizedString($1.name, comment: "")
                }), id: \.id) { nation in
                NavigationLink(destination: NationDetail(nation: nation)){
                    NationRow(nation: nation)
                }
            }
        }.navigationBarTitle("list", displayMode:.inline)
            .navigationBarItems(trailing: SearchButton())
            .onAppear(){
                if self.settings.search == "" {
                    self.settings.showSearch = false
                }
        }
    }
}

struct NationList_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                NationList().environmentObject(GlobalSettings())
            }
        }
    }
}
