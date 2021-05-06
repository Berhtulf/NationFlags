//
//  GameViewModel.swift
//  NationFlags
//
//  Created by Martin Václavík on 04.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

final class GameModeViewModel: ObservableObject {
    @Published var gameMode: Int = 1
    @Published var settings = GlobalSettings.shared
    
    private func toggleMap(position:Int){
        objectWillChange.send()
        if settings.img[position] > 0 {
            settings.img[position] = 0
        }else{
            settings.img[position] = 1
        }
    }
    
    //MARK: - Intents
    func toggleMapRegion(region: MapRegion) {
        switch region {
        case .americas:
            toggleMap(position: 0)
            settings.toggleRegion(.americas)
        case .europe:
            toggleMap(position: 1)
            settings.toggleRegion(.europe)
        case .africa:
            toggleMap(position: 2)
            settings.toggleRegion(.africa)
        case .asia:
            toggleMap(position: 3)
            settings.toggleRegion(.asia)
        case .oceania:
            toggleMap(position: 4)
            settings.toggleRegion(.oceania)
        }
    }
    
    func handleMapDragGesture(location: CGPoint, map: CGSize) {
        if location.x > map.width * 0.75 && location.y > map.height / 2{
            toggleMapRegion(region: .oceania)
        }else if location.x < map.width * 0.35{
            toggleMapRegion(region: .americas)
        }else if location.x > map.width * 0.35 && location.x < map.width * 0.6 && location.y > map.height * 0.3{
            toggleMapRegion(region: .africa)
        }else if location.x > map.width * 0.35 && location.x < map.width * 0.6 && location.y < map.height * 0.3{
            toggleMapRegion(region: .europe)
        }else if location.x > map.width * 0.6 && location.y < map.height / 2{
            toggleMapRegion(region: .asia)
        }
    }
}
