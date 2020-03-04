//
//  ContentView.swift
//  DemoApp
//
//  Created by Martin Václavík on 25/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NationDetail: View {
    var nation: Nation
    @State private var selection = "default"
    var body: some View {
        TabView(selection: $selection){
            ZStack {
                NationDetailInfo(nation: nation)
            }
            .tag("default")
            .tabItem{
                VStack {
                    Image(systemName: "info.circle.fill")
                    Text("Info")
                }
            }
            ZStack {
                MapView(coord: nation.locationCoordinate, zoom: nation.locationZoom)
            }
            .tag("map")
            .tabItem{
                VStack {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            }
        }.navigationBarTitle(LocalizedStringKey(nation.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                NationDetail(nation: restNation.randomElement()!)
            }
        }
    }
}

struct NationDetailInfo: View {
    var nation: Nation
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        FlagImage(image: nation.image).padding()
                        Text(LocalizedStringKey(nation.name))
                            .font(.title)
                    }
                }
                Divider()
                HStack{
                    Text("MainCity")
                        .padding(.leading)
                    Spacer()
                    Text(LocalizedStringKey(nation.capital))
                        .padding(.trailing)
                }
                Divider()
                HStack{
                    Text("Population")
                        .padding(.leading)
                    Spacer()
                    Text("\(nation.population)")
                    .padding(.trailing)
                }
                Divider()
                HStack{
                    Text("StateSize")
                        .padding(.leading)
                    Spacer()
                    Text("\(nation.area.removeZerosFromEnd()) km²")
                        .padding(.trailing)
                }
                Divider()
                HStack{
                    Text("Density")
                        .padding(.leading)
                    Spacer()
                    Text("\(nation.density)/km²")
                        .padding(.trailing)
                }
                Divider()
            }
            .padding()
        }
    }
}
