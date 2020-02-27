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
            if !self.firstLaunch {
                VStack{
                    Image("HelpImage")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                    Button(action:{
                        UserDefaults.standard.set(true, forKey: "firstLaunch")
                        withAnimation(){
                            self.firstLaunch = true
                        }
                    }){
                        Text("OK")
                            .modifier(BlueMenuButton())
                    }
                }
                .transition(AnyTransition.slideBottom)
            }else {
                VStack{
                    VStack{
                        Text("chooseMode").font(.headline)
                        Picker(selection: $settings.gameMode, label: Text("ModeSelect")) {
                            Text("Flags").tag(1)
                            Text("Capitals").tag(2)
                        }.pickerStyle(SegmentedPickerStyle())
                    }.padding()
                    VStack{
                        MapSelectView()
                        
                        ModeScrollView()
                    }
                    Spacer()
                }.transition(AnyTransition.move(edge: .top))
            }
        }
        .navigationBarHidden(self.firstLaunch ? false : true)
        .navigationBarTitle(self.firstLaunch ? "GameSettings" : "", displayMode: .inline)
        .navigationBarItems(trailing: Button(action:{
            UserDefaults.standard.set(false, forKey: "firstLaunch")
            withAnimation(){
                self.firstLaunch.toggle()
            }
        }){
            Image(systemName: "questionmark.circle")
        })
    }
}

struct ModeSelect_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModeSelect().environmentObject(UserSettings())
        }//.environment(\.colorScheme, .dark)
    }
}
