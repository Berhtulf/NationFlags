//
//  MainScreen.swift
//  Countries
//
//  Created by Martin Václavík on 01/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var settings: UserSettings
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
                NavigationLink(destination: NationList()) {
                    Text("list")
                        .modifier(MainMenuButton())
                }.font(.title)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            .accentColor(.orange)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
