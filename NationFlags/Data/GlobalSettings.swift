//
//  GlobalVariables.swift
//  Countries
//
//  Created by Martin Václavík on 21/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//
import SwiftUI

class GlobalSettings: ObservableObject {
    var updateDate:Date = Date(timeIntervalSince1970: 1594029613)
    
    @Environment(\.managedObjectContext) var managedObjectContext
    // Prodleva před načtením dalších otázek
    let nextDelay = 0.5
    let learnDelay = 1.5
    
    @Published var gameMode = 1
    @Published var listRegion = 2
    @Published var showSearch:Bool = false
    @Published var search:String = ""
    
    @Published var nationList: [Nation]? = nil
    @Published var img: [Int] = [0,0,0,0,0]
    var imgName:String{
        var retval = ""
        for item in img {
            retval = retval + String(item)
        }
        return retval
    }
    
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
    
    var options:[Nation] = []
    var correctOption:Nation? = nil
    @Published var finish = false
    
    @Published var history = Set<Nation?>()
    
    func generateOptions() {
        if history.count < pool.count {
            repeat{
                self.correctOption = pool.randomElement()!
            } while history.contains(self.correctOption)
            
            var options = Set<Nation>()
            let correctOption = self.correctOption
            options.insert(correctOption!)
            history.insert(correctOption)
            while options.count < 4 {
                if let option = pool.randomElement(){
                    options.insert(option)
                }
            }
            self.options = options.map({$0}).shuffled()
        }else{
            self.finish = true
        }
    }
}
