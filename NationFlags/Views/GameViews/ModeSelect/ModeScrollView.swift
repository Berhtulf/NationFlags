//
//  ModeScrollView.swift
//  NationFlags
//
//  Created by Martin Václavík on 27/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import GameKit

struct ModeScrollView: View {
    @EnvironmentObject var settings: GlobalSettings
    @AppStorage("NameToFlag") private var NameToFlag = 0
    @AppStorage("NameToFlagError") private var NameToFlagError = 0
    @AppStorage("FlagToName") private var FlagToName = 0
    @AppStorage("FlagToNameError") private var FlagToNameError = 0
    
    @AppStorage("NameToCity") private var NameToCity = 0
    @AppStorage("NameToCityError") private var NameToCityError = 0
    @AppStorage("CityToName") private var CityToName = 0
    @AppStorage("CityToNameError") private var CityToNameError = 0
    
    @State private var showSubMenu:Int = 0
    
    var gameMode:Int
    var body: some View {
        ScrollView{
            if self.settings.regions.count > 0{
                if self.gameMode == 0 {
                    VStack{
                        Divider()
                        HStack{
                            Text("FlagToName")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(self.showSubMenu == 1 ? 90 : 0))
                        }
                        .padding(.horizontal).contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(){
                                if self.showSubMenu == 1 {
                                    self.showSubMenu = 0
                                }else{
                                    self.showSubMenu = 1
                                }
                            }
                        }
                        if self.showSubMenu == 1 {
                            Divider()
                            VStack{
                                HStack{
                                    NavigationLink(destination: FlagToNameView(), label: {
                                        HStack{
                                            Text("TimedGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.FlagToName)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: FlagToNameErrorView(), label: {
                                        HStack{
                                            Text("ErrorGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.FlagToNameError)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: FlagToNameLearnView(), label: {
                                        HStack{
                                            Text("LearnGame")
                                                .padding(.leading)
                                            Spacer()
                                            Image(systemName: "briefcase.fill")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                            }
                            .transition(.customTransition)
                        }
                        Divider()
                        HStack{
                            Text("NameToFlag")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(self.showSubMenu == 2 ? 90 : 0))
                        }
                        .padding(.horizontal).contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(){
                                if self.showSubMenu == 2 {
                                    self.showSubMenu = 0
                                }else{
                                    self.showSubMenu = 2
                                }
                            }
                        }
                        Divider()
                        if self.showSubMenu == 2 {
                            VStack{
                                HStack{
                                    NavigationLink(destination: NameToFlagView(), label: {
                                        HStack{
                                            Text("TimedGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.NameToFlag)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: NameToFlagErrorView(), label: {
                                        HStack{
                                            Text("ErrorGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.NameToFlagError)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: NameToFlagLearnView(), label: {
                                        HStack{
                                            Text("LearnGame")
                                                .padding(.leading)
                                            Spacer()
                                            Image(systemName: "briefcase.fill")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                            }
                            .transition(.customTransition)
                        }
                    }.padding(.vertical)
                }
                if self.gameMode == 1 {
                    VStack{
                        Divider()
                        HStack{
                            Text("CityToState")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(self.showSubMenu == 1 ? 90 : 0))
                        }
                        .padding(.horizontal).contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(){
                                if self.showSubMenu == 1 {
                                    self.showSubMenu = 0
                                }else{
                                    self.showSubMenu = 1
                                }
                            }
                        }
                        if self.showSubMenu == 1 {
                            Divider()
                            VStack{
                                HStack{
                                    NavigationLink(destination: CityToNameView(), label: {
                                        HStack{
                                            Text("TimedGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.CityToName)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: CityToNameErrorView(), label: {
                                        HStack{
                                            Text("ErrorGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.CityToNameError)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: CityToNameLearnView(), label: {
                                        HStack{
                                            Text("LearnGame")
                                                .padding(.leading)
                                            Spacer()
                                            Image(systemName: "briefcase.fill")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                            }
                            .transition(.customTransition)
                        }
                        Divider()
                        HStack{
                            Text("StateToCity")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(self.showSubMenu == 2 ? 90 : 0))
                        }
                        .padding(.horizontal)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(Animation.spring()){
                                
                                if self.showSubMenu == 2 {
                                    self.showSubMenu = 0
                                }else{
                                    self.showSubMenu = 2                                            }
                            }
                        }
                        Divider()
                        if self.showSubMenu == 2 {
                            VStack{
                                HStack{
                                    NavigationLink(destination: NameToCityView(), label: {
                                        HStack{
                                            Text("TimedGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.NameToCity)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: NameToCityErrorView(), label: {
                                        HStack{
                                            Text("ErrorGame")
                                                .padding(.leading)
                                            Spacer()
                                            Text(String(self.NameToCityError)).font(.callout)
                                            Image(systemName: "rosette")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                                HStack{
                                    NavigationLink(destination: NameToCityLearnView(), label: {
                                        HStack{
                                            Text("LearnGame")
                                                .padding(.leading)
                                            Spacer()
                                            Image(systemName: "briefcase.fill")
                                        }}).foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                Divider()
                            }
                            .transition(.customTransition)
                        }
                    }.padding(.vertical)
                }
            }
            else {
                VStack{
                    Divider()
                    HStack{
                        Text(self.gameMode == 0 ? "FlagToName" : "CityToState")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.foregroundColor(Color.secondary)
                        .padding(.horizontal)
                    Divider()
                    HStack{
                        Text(self.gameMode == 0 ? "NameToFlag" : "StateToCity")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.foregroundColor(Color.secondary)
                        .padding(.horizontal)
                    Divider()
                }.padding(.vertical)
            }
        }
        .onAppear() {
            self.settings.timer?.invalidate()
        }
    }
}

struct ModeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ModeScrollView(gameMode: 1).environmentObject(GlobalSettings())
    }
}
