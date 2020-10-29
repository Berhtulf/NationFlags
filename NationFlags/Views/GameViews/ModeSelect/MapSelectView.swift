//
//  MapSelectView.swift
//  NationFlags
//
//  Created by Martin Václavík on 26/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import GameKit

struct MapSelectView: View {
    @EnvironmentObject var settings: GlobalSettings
    @State var mapWidth:CGFloat = 301
    @State var mapHeight:CGFloat = 0
    public var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded {
                if $0.location.x > self.mapWidth * 0.75 && $0.location.y > self.mapHeight / 2{
                    if self.settings.regions.contains("Oceania") {
                        self.settings.regions.remove("Oceania")
                    }else{
                        self.settings.regions.insert("Oceania")
                    }
                    self.toogleMap(position: 4)
                }else if $0.location.x < self.mapWidth * 0.35{
                    if self.settings.regions.contains("Americas") {
                        self.settings.regions.remove("Americas")
                    }else{
                        self.settings.regions.insert("Americas")
                    }
                    self.toogleMap(position: 0)
                }else if $0.location.x > self.mapWidth * 0.35 && $0.location.x < self.mapWidth * 0.6 && $0.location.y > self.mapHeight * 0.3{
                    if self.settings.regions.contains("Africa") {
                        self.settings.regions.remove("Africa")
                    }else{
                        self.settings.regions.insert("Africa")
                    }
                    self.toogleMap(position: 2)
                }else if $0.location.x > self.mapWidth * 0.35 && $0.location.x < self.mapWidth * 0.6 && $0.location.y < self.mapHeight * 0.3{
                    if self.settings.regions.contains("Europe") {
                        self.settings.regions.remove("Europe")
                    }else{
                        self.settings.regions.insert("Europe")
                    }
                    self.toogleMap(position: 1)
                }else if $0.location.x > self.mapWidth * 0.6 && $0.location.y < self.mapHeight / 2{
                    if self.settings.regions.contains("Asia") {
                        self.settings.regions.remove("Asia")
                    }else{
                        self.settings.regions.insert("Asia")
                    }
                    self.toogleMap(position: 3)
                }
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
    
    var body: some View {
        GeometryReader { geometryReader in
            ModeSelectMapImage()
                .gesture(self.dragGesture)
                .onAppear(){
                    GKAccessPoint.shared.isActive = false
                    self.mapWidth = geometryReader.size.width
                    self.mapHeight = geometryReader.size.height
            }
        }.frame(minWidth: 300, idealWidth: mapWidth, maxWidth: 414, idealHeight: mapHeight, maxHeight: 225)
    }
}

struct MapSelectView_Previews: PreviewProvider {
    static var previews: some View {
        MapSelectView().environmentObject(GlobalSettings())
    }
}
