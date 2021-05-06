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
    @EnvironmentObject var viewModel: GameModeViewModel
    @AppStorage("NameToFlag") private var NameToFlag = 0
    @AppStorage("NameToFlagError") private var NameToFlagError = 0
    @AppStorage("FlagToName") private var FlagToName = 0
    @AppStorage("FlagToNameError") private var FlagToNameError = 0
    
    @AppStorage("NameToCity") private var NameToCity = 0
    @AppStorage("NameToCityError") private var NameToCityError = 0
    @AppStorage("CityToName") private var CityToName = 0
    @AppStorage("CityToNameError") private var CityToNameError = 0
    
    @State private var showSubMenu:Int?
    
    func toggleSubmenu(index: Int) {
        withAnimation{
            if showSubMenu == index {
                showSubMenu = nil
            }else{
                showSubMenu = index
            }
        }
    }
    
    var body: some View {
        ScrollView{
            if viewModel.gameMode == 0 {
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
                        toggleSubmenu(index: 1)
                    }
                    if self.showSubMenu == 1 {
                        Divider()
                        VStack{
                            HStack{
                                NavigationLink(destination: FlagToNameView()) {
                                    HStack{
                                        Text("TimedGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.FlagToName)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: FlagToNameErrorView()) {
                                    HStack{
                                        Text("ErrorGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.FlagToNameError)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: FlagToNameLearnView()) {
                                    HStack{
                                        Text("LearnGame")
                                            .padding(.leading)
                                        Spacer()
                                        Image(systemName: "briefcase.fill")
                                    }}
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
                        toggleSubmenu(index: 2)
                    }
                    Divider()
                    if self.showSubMenu == 2 {
                        VStack{
                            HStack{
                                NavigationLink(destination: NameToFlagView()) {
                                    HStack{
                                        Text("TimedGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.NameToFlag)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToFlagErrorView()) {
                                    HStack{
                                        Text("ErrorGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.NameToFlagError)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToFlagLearnView()) {
                                    HStack{
                                        Text("LearnGame")
                                            .padding(.leading)
                                        Spacer()
                                        Image(systemName: "briefcase.fill")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                        }
                        .transition(.customTransition)
                    }
                }.padding(.vertical)
            } else {
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
                        toggleSubmenu(index: 1)
                    }
                    if self.showSubMenu == 1 {
                        Divider()
                        VStack{
                            HStack{
                                NavigationLink(destination: CityToNameView()) {
                                    HStack{
                                        Text("TimedGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.CityToName)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: CityToNameErrorView()) {
                                    HStack{
                                        Text("ErrorGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.CityToNameError)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: CityToNameLearnView()) {
                                    HStack{
                                        Text("LearnGame")
                                            .padding(.leading)
                                        Spacer()
                                        Image(systemName: "briefcase.fill")
                                    }}
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
                        toggleSubmenu(index: 2)
                    }
                    Divider()
                    if self.showSubMenu == 2 {
                        VStack{
                            HStack{
                                NavigationLink(destination: NameToCityView()) {
                                    HStack{
                                        Text("TimedGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.NameToCity)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToCityErrorView()) {
                                    HStack{
                                        Text("ErrorGame")
                                            .padding(.leading)
                                        Spacer()
                                        Text(String(self.NameToCityError)).font(.callout)
                                        Image(systemName: "rosette")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToCityLearnView()) {
                                    HStack{
                                        Text("LearnGame")
                                            .padding(.leading)
                                        Spacer()
                                        Image(systemName: "briefcase.fill")
                                    }}
                            }
                            .padding(.horizontal)
                            Divider()
                        }
                        .transition(.customTransition)
                    }
                }.padding(.vertical)
            }
        }
        .foregroundColor(self.settings.regions.isEmpty ? .gray : .primary)
        .disabled(self.settings.regions.isEmpty)
    }
}

struct ModeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModeScrollView()
                .environmentObject(GlobalSettings())
                .environmentObject(GameModeViewModel())
        }
    }
}
