//
//  ModeSelect.swift
//  Countries
//
//  Created by Martin Václavík on 10/12/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ModeSelect: View {
    @EnvironmentObject var settings: UserSettings
    @State private var firstLaunch = UserDefaults.standard.bool(forKey: "firstLaunch")
    @State private var gameMode = UserDefaults.standard.integer(forKey: "gameMode")
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Text("chooseMode").font(.headline)
                    Picker(selection: $gameMode, label: Text("ModeSelect")) {
                        Text("Flags").tag(0)
                        Text("Capitals").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                }.padding()
                VStack{
                    MapSelectView()
                    ModeScrollView(gameMode: self.gameMode)
                }
                Spacer()
            }.transition(AnyTransition.move(edge: .top))
                .sheet(isPresented: $firstLaunch){
                VStack{
                    Image("HelpImage")
                    .resizable()
                    .padding()
                    .aspectRatio(contentMode: .fit)
                }.onDisappear(){
                        UserDefaults.standard.set(false, forKey: "firstLaunch")
                    }
            }
        }
        .navigationBarTitle("GameSettings", displayMode: .inline)
        .navigationBarItems(trailing: Button(action:{
            UserDefaults.standard.set(false, forKey: "firstLaunch")
                self.firstLaunch.toggle()
        }){
            Image(systemName: "questionmark.circle")
                .padding()
        })
        .onDisappear(){
            UserDefaults.standard.set(self.gameMode, forKey: "gameMode")
        }
        .onAppear(){
            self.gameMode = UserDefaults.standard.integer(forKey: "gameMode")
        }
    }
}

struct ModeSelect_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModeSelect().environmentObject(UserSettings())
        }//.environment(\.colorScheme, .dark)
    }
}
