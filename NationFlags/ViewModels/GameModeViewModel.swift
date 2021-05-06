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
    @Published var mapIndexes = [0,0,0,0,0]
    var imgName: String {
        mapIndexes.map{ String($0) }.joined()
    }
    private func toggleMap(position:Int){
        if mapIndexes[position] > 0 {
            mapIndexes[position] = 0
        }else{
            mapIndexes[position] = 1
        }
    }
    
    //MARK: - Intents
    func toggleMapRegion(region: MapRegion) {
        switch region {
        case .americas:
            toggleMap(position: 0)
            GlobalSettings.shared.toggleRegion(.americas)
        case .europe:
            toggleMap(position: 1)
            GlobalSettings.shared.toggleRegion(.europe)
        case .africa:
            toggleMap(position: 2)
            GlobalSettings.shared.toggleRegion(.africa)
        case .asia:
            toggleMap(position: 3)
            GlobalSettings.shared.toggleRegion(.asia)
        case .oceania:
            toggleMap(position: 4)
            GlobalSettings.shared.toggleRegion(.oceania)
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
