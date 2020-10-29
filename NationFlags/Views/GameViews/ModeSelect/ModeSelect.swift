//
//  ModeSelect.swift
//  Countries
//
//  Created by Martin Václavík on 10/12/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ModeSelect: View {
    @EnvironmentObject var settings: GlobalSettings
    @AppStorage("firstLaunch") private var firstLaunch = true
    @AppStorage("gameMode") private var gameMode = 1
    
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
                }
            }
        }
        .navigationBarTitle("GameSettings", displayMode: .inline)
        .navigationBarItems(trailing: Button(action:{
            firstLaunch.toggle()
        }){
            Image(systemName: "questionmark.circle")
                .padding()
        })
        .onAppear(){
            self.settings.finish = false
            AppStoreReviewPrompt.requestReviewIfAppropriate()
        }
    }
}

struct ModeSelect_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModeSelect().environmentObject(GlobalSettings())
        }//.environment(\.colorScheme, .dark)
    }
}
