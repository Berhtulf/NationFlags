//
//  ModeScrollView.swift
//  NationFlags
//
//  Created by Martin Václavík on 27/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ModeScrollView: View {
    @EnvironmentObject var settings: UserSettings
    @State private var NameToFlag = UserDefaults.standard.integer(forKey: "NameToFlag")
    @State private var NameToFlagError = UserDefaults.standard.integer(forKey: "NameToFlagError")
    @State private var FlagToName = UserDefaults.standard.integer(forKey: "FlagToName")
    @State private var FlagToNameError = UserDefaults.standard.integer(forKey: "FlagToNameError")
    
    @State private var NameToCity = UserDefaults.standard.integer(forKey: "NameToCity")
    @State private var NameToCityError = UserDefaults.standard.integer(forKey: "NameToCityError")
    @State private var CityToName = UserDefaults.standard.integer(forKey: "CityToName")
    @State private var CityToNameError = UserDefaults.standard.integer(forKey: "CityToNameError")
    
    @State private var showSubMenu:Int = 0
    func refreshScore(){
        self.NameToFlag = UserDefaults.standard.integer(forKey: "NameToFlag")
        self.NameToFlagError = UserDefaults.standard.integer(forKey: "NameToFlagError")
        self.FlagToName = UserDefaults.standard.integer(forKey: "FlagToName")
        self.FlagToNameError = UserDefaults.standard.integer(forKey: "FlagToNameError")
        
        self.CityToName = UserDefaults.standard.integer(forKey: "CityToName")
        self.CityToNameError = UserDefaults.standard.integer(forKey: "CityToNameError")
        self.NameToCity = UserDefaults.standard.integer(forKey: "NameToCity")
        self.NameToCityError = UserDefaults.standard.integer(forKey: "NameToCityError")
    }
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
            self.refreshScore()
        }
    }
}

struct ModeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ModeScrollView(gameMode: 1).environmentObject(UserSettings())
    }
}
