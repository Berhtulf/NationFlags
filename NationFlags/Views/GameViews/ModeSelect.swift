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
    public var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded {
                print("Changed \($0.location)")
                if $0.location.x > 310 && $0.location.y > 110{
                    if self.settings.regions.contains("Oceania") {
                        self.settings.regions.remove("Oceania")
                    }else{
                        self.settings.regions.insert("Oceania")
                    }
                    self.toogleMap(position: 4)
                }
                else if $0.location.x < 140 {
                    if self.settings.regions.contains("Americas") {
                        self.settings.regions.remove("Americas")
                    }else{
                        self.settings.regions.insert("Americas")
                    }
                    self.toogleMap(position: 0)
                }
                else if ($0.location.x > 140 && $0.location.x < 240 && $0.location.y > 70){
                    if self.settings.regions.contains("Africa") {
                        self.settings.regions.remove("Africa")
                    }else{
                        self.settings.regions.insert("Africa")
                    }
                    self.toogleMap(position: 2)
                }
                else if $0.location.x > 240 && $0.location.y < 120 {
                    if self.settings.regions.contains("Asia") {
                        self.settings.regions.remove("Asia")
                    }else{
                        self.settings.regions.insert("Asia")
                    }
                    self.toogleMap(position: 3)
                }
                else if ($0.location.x > 140 && $0.location.x < 240 && $0.location.y < 405) {
                    if self.settings.regions.contains("Europe") {
                        self.settings.regions.remove("Europe")
                    }else{
                        self.settings.regions.insert("Europe")
                    }
                    self.toogleMap(position: 1)
                }
                //print(self.settings.regions)
        }
    }
    func toogleMap(position:Int){
        if settings.img[position] > 0 {
            settings.img[position] = 0
        }else{
            settings.img[position] = 1
        }
        //print(settings.img)
    }
    
    @State private var showSubMenu:Int = 0
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Text("chooseMode").font(.system(size: 20))
                    Picker(selection: $settings.gameMode, label: Text("ModeSelect")) {
                        Text("Flags").tag(1)
                        Text("Capitals").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                }.padding()
                VStack{
                    ModeSelectMapImage()
                        .gesture(dragGesture)
                    ScrollView{
                        if self.settings.regions.count > 0{
                            if self.settings.gameMode == 1 {
                                VStack{
                                    Divider()
                                    HStack{
                                        Text("FlagToName")
                                            .font(.system(size: 20))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .rotationEffect(.degrees(self.showSubMenu == 1 ? 90 : 0))
                                            .animation(.default)
                                    }
                                    .padding(.horizontal).contentShape(Rectangle())
                                    .onTapGesture {
                                        withAnimation(Animation.spring()){
                                            if self.showSubMenu == 1 {
                                                self.showSubMenu = 0
                                            }else{
                                                self.showSubMenu = 1
                                            }
                                        }
                                    }
                                    if self.showSubMenu == 1 {
                                        Divider()
                                        HStack{
                                            NavigationLink(destination: FlagToNameView(), label: {
                                                HStack{
                                                    Text("TimedGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                        Divider()
                                        HStack{
                                            NavigationLink(destination: FlagToNameErrorView(), label: {
                                                HStack{
                                                    Text("ErrorGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                    }
                                    Divider()
                                    HStack{
                                        Text("NameToFlag")
                                            .font(.system(size: 20))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .rotationEffect(.degrees(self.showSubMenu == 2 ? 90 : 0))
                                            .animation(.default)
                                    }
                                    .padding(.horizontal).contentShape(Rectangle())
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
                                        HStack{
                                            NavigationLink(destination: NameToFlagView(), label: {
                                                HStack{
                                                    Text("TimedGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                        Divider()
                                        HStack{
                                            Text("ErrorGame")
                                                .padding(.leading)
                                                .font(.system(size: 20))
                                            NavigationLink(destination: NameToFlagErrorView(), label: {
                                                EmptyView()
                                            }).frame(width:1)
                                            Spacer()
                                            Text("999").font(.callout)
                                            Image(systemName: "rosette")
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                        Divider()
                                    }
                                }.padding(.vertical)
                            }
                            if self.settings.gameMode == 2 {
                                VStack{
                                    Divider()
                                    HStack{
                                        Text("CityToState")
                                            .font(.system(size: 20))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .rotationEffect(.degrees(self.showSubMenu == 1 ? 90 : 0))
                                            .animation(.default)
                                    }
                                    .padding(.horizontal).contentShape(Rectangle())
                                    .onTapGesture {
                                        withAnimation(Animation.spring()){
                                            if self.showSubMenu == 1 {
                                                self.showSubMenu = 0
                                            }else{
                                                self.showSubMenu = 1
                                            }
                                        }
                                    }
                                    if self.showSubMenu == 1 {
                                        Divider()
                                        HStack{
                                            NavigationLink(destination: CityToNameView(), label: {
                                                HStack{
                                                    Text("TimedGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                        Divider()
                                        HStack{
                                            NavigationLink(destination: CityToNameView(), label: {
                                                HStack{
                                                    Text("ErrorGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                    }
                                    Divider()
                                    HStack{
                                        Text("StateToCity")
                                            .font(.system(size: 20))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .rotationEffect(.degrees(self.showSubMenu == 2 ? 90 : 0))
                                            .animation(.default)
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
                                        HStack{
                                            NavigationLink(destination: NameToCityView(), label: {
                                                HStack{
                                                    Text("TimedGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                        Divider()
                                        HStack{
                                            NavigationLink(destination: NameToCityErrorView(), label: {
                                                HStack{
                                                    Text("ErrorGame")
                                                        .padding(.leading)
                                                        .font(.system(size: 20))
                                                    Spacer()
                                                    Text("999").font(.callout)
                                                    Image(systemName: "rosette")
                                                }}).foregroundColor(Color.primary)
                                        }.transition(.customTransition)
                                            .padding(.horizontal)
                                        Divider()
                                    }
                                }.padding(.vertical)
                                
                            }
                        }else {
                            VStack{
                                Divider()
                                HStack{
                                    Text(self.settings.gameMode == 1 ? "FlagToName" : "CityToState")
                                        .font(.system(size: 20))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }.foregroundColor(Color.secondary)
                                    .padding(.horizontal)
                                Divider()
                                HStack{
                                    Text(self.settings.gameMode == 1 ? "NameToFlag" : "StateToCity")
                                        .font(.system(size: 20))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }.foregroundColor(Color.secondary)
                                    .padding(.horizontal)
                                Divider()
                            }.padding(.vertical)
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarTitle("GameSettings", displayMode: .inline)
    }
}

struct ModeSelect_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                ModeSelect().environmentObject(UserSettings())
            }
        }
    }
}
extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        return insertion
    }
}
