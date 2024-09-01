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
    @StateObject private var model = NationListViewModel()
    @EnvironmentObject private var settings: GlobalSettings

    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                List(model.nationList, id: \.id) { nation in
                    NavigationLink(destination: NationDetail(nation: nation, location: MKCoordinateRegion(center: nation.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: nation.locationZoom, longitudeDelta: nation.locationZoom)))) {
                        NationRow(nation: nation)
                    }
                }
                .searchable(text: $model.search)
                .listStyle(.plain)
            } else {
                if model.showSearch {
                    SearchBar()
                        .environmentObject(model)
                        .padding(.top)
                        .padding(.horizontal)
                }
                List(model.nationList, id: \.id) { nation in
                    NavigationLink(destination: NationDetail(nation: nation, location: MKCoordinateRegion(center: nation.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: nation.locationZoom, longitudeDelta: nation.locationZoom)))) {
                        NationRow(nation: nation)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationBarTitle("list", displayMode: .inline)
        .toolbar {
            if #unavailable(iOS 15.0) {
                SearchButton()
                    .environmentObject(model)
            }
        }
        .onAppear {
            GKAccessPoint.shared.isActive = false
            if model.search.isEmpty {
                model.showSearch = false
            }
        }
    }
}

#Preview {
    NavigationView {
        NationList()
            .environmentObject(GlobalSettings())
    }
}
