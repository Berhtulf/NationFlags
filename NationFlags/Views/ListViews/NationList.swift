//
//  NationList.swift
//  DemoApp
//
//  Created by Martin Václavík on 26/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI
import GameKit
import MapKit

struct NationList: View {
    @StateObject var model = NationListViewModel()
    @EnvironmentObject var settings: GlobalSettings
    var body: some View {
        VStack{
            if model.showSearch{
                SearchBar()
                    .environmentObject(model)
                    .padding(.top)
                    .padding(.horizontal)
            }
            List(model.nationList, id: \.id) { nation in
                NavigationLink(destination: NationDetail(nation: nation, location: MKCoordinateRegion(center: nation.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: nation.locationZoom, longitudeDelta: nation.locationZoom)) )){
                    NationRow(nation: nation)
                }
            }
        }.navigationBarTitle("list", displayMode: .inline)
        .toolbar(content: {
            SearchButton()
                .environmentObject(model)
        })
        .onAppear(){
            GKAccessPoint.shared.isActive = false
            if model.search == "" {
                model.showSearch = false
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
