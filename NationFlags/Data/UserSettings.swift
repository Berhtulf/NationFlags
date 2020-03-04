//
//  GlobalVariables.swift
//  Countries
//
//  Created by Martin Václavík on 21/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Environment(\.managedObjectContext) var managedObjectContext
    // Prodleva před načtením dalších otázek
    @Published var nextDelay = 0.5
    @Published var learnDelay = 1.0
    @Published var gameMode = 1
    @Published var listRegion = 2
    @Published var showSearch:Bool = false
    @Published var search:String = ""
    
    @Published var nationList: [Nation]? = nil
    @Published var img: [Int] = [0,0,0,0,0]
    @Published var regions:Set<String> = []
    var pool:[Nation]{
        return restNation.filter{regions.contains($0.region)}
    }
    
    func saveScore(score:Int64, view:String){
        let dbScore = UserDefaults.standard.integer(forKey: view)
        if score > dbScore {
            UserDefaults.standard.set(score, forKey: view)
        }
    }
}
