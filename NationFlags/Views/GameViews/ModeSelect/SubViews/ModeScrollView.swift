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
    
    var body: some View {
        ScrollView{
            if viewModel.gameMode == 0 {
                VStack{
                    Divider()
                    HStack{
                        Text("FlagToName")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(viewModel.showingMenu == 1 ? 90 : 0))
                    }
                    .padding(.horizontal).contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleSubmenu(index: 1)
                    }
                    if viewModel.showingMenu == 1 {
                        Divider()
                        VStack{
                            HStack{
                                NavigationLink(destination: FlagToNameView()) {
                                    GameModeRowView(title: "TimedGame", score: FlagToName)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: FlagToNameErrorView()) {
                                    GameModeRowView(title: "ErrorGame", score: FlagToNameError)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: FlagToNameLearnView()) {
                                    GameModeRowView(title: "LearnGame", practice: true)
                                }
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
                            .rotationEffect(.degrees(viewModel.showingMenu == 2 ? 90 : 0))
                    }
                    .padding(.horizontal).contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleSubmenu(index: 2)
                    }
                    Divider()
                    if viewModel.showingMenu == 2 {
                        VStack{
                            HStack{
                                NavigationLink(destination: NameToFlagView()) {
                                    GameModeRowView(title: "TimedGame", score: NameToFlag)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToFlagErrorView()) {
                                    GameModeRowView(title: "TimedGame", score: NameToFlagError)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToFlagLearnView()) {
                                    GameModeRowView(title: "LearnGame", practice: true)
                                }
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
                            .rotationEffect(.degrees(viewModel.showingMenu == 1 ? 90 : 0))
                    }
                    .padding(.horizontal).contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleSubmenu(index: 1)
                    }
                    if viewModel.showingMenu == 1 {
                        Divider()
                        VStack{
                            HStack{
                                NavigationLink(destination: CityToNameView()) {
                                    GameModeRowView(title: "TimedGame", score: CityToName)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: CityToNameErrorView()) {
                                    GameModeRowView(title: "ErrorGame", score: CityToNameError)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: CityToNameLearnView()) {
                                    GameModeRowView(title: "LearnGame", practice: true)
                                }
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
                            .rotationEffect(.degrees(viewModel.showingMenu == 2 ? 90 : 0))
                    }
                    .padding(.horizontal)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleSubmenu(index: 2)
                    }
                    Divider()
                    if viewModel.showingMenu == 2 {
                        VStack{
                            HStack{
                                NavigationLink(destination: NameToCityView()) {
                                    GameModeRowView(title: "TimedGame", score: NameToCity)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToCityErrorView()) {
                                    GameModeRowView(title: "ErrorGame", score: NameToCityError)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack{
                                NavigationLink(destination: NameToCityLearnView()) {
                                    GameModeRowView(title: "LearnGame", practice: true)
                                }
                            }
                            .padding(.horizontal)
                            Divider()
                        }
                        .transition(.customTransition)
                    }
                }.padding(.vertical)
            }
        }
        .foregroundColor(settings.regions.isEmpty ? .gray : .primary)
        .disabled(settings.regions.isEmpty)
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

