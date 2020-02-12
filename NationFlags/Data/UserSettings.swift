//
//  GlobalVariables.swift
//  Countries
//
//  Created by Martin Václavík on 21/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    // Prodleva před načtením dalších otázek
    @Published var nextDelay = 0.5
    @Published var gameMode = 1
    @Published var listRegion = 2
    @Published var showSearch:Bool = false
    @Published var search:String = ""
    
    @Published var nationList: [Nation]? = nil
    @Published var img: [Int] = [0,0,0,0,0]
    @Published var regions:Set<String> = ["Asia"]
    var pool:[Nation]{
        return restNation.filter{regions.contains($0.region)}
    }
}
