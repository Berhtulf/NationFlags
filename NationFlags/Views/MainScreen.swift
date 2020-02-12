//
//  MainScreen.swift
//  Countries
//
//  Created by Martin Václavík on 01/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView{
        VStack {
            Spacer()
            Image("Icon")
                .resizable()
                .padding()
                .aspectRatio(contentMode: .fit)
                .frame(height:245)
            Text("Countries").font(.largeTitle)
                .padding(.vertical,40)
            NavigationLink(destination: ModeSelect()){
                Text("play")
                    .modifier(MainMenuButton())
            }.font(.title)
            
            //            NavigationLink(destination: ScoreView()) {
            //                Text("TopScore")
            //                    .modifier(MainMenuButton())
            //            }.font(.title)
            //            .padding(7)
            NavigationLink(destination: NationList()) {
                Text("list")
                    .modifier(MainMenuButton())
            }.font(.title)
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainScreen()
                .environment(\.locale, Locale(identifier: "cs"))
            MainScreen()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            MainScreen()
                .previewDevice(PreviewDevice(rawValue: "iPhone 7"))
        }
    }
}
