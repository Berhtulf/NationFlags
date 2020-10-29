//
//  GlobalVariables.swift
//  Countries
//
//  Created by Martin Václavík on 21/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//
import SwiftUI
import GameKit

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
    
    
    func saveScore(score:Int, view:String){
        var achievements = [GKAchievement]()
        achievements.append(GKAchievement.init(identifier: "FirstGamePlayed"))
        
        let dbScore = UserDefaults.standard.integer(forKey: view)
        
        if imgName == "10000" && score == pool.count * 10 {achievements.append(GKAchievement.init(identifier: "PerfectAME"))}
        if imgName == "01000" && score == pool.count * 10 {achievements.append(GKAchievement.init(identifier: "PerfectEU"))}
        if imgName == "00100" && score == pool.count * 10 {achievements.append(GKAchievement.init(identifier: "PerfectAFR"))}
        if imgName == "00010" && score == pool.count * 10 {achievements.append(GKAchievement.init(identifier: "PerfectAsia"))}
        if imgName == "00001" && score == pool.count * 10 {achievements.append(GKAchievement.init(identifier: "PerfectAUS"))}
        if imgName == "11111" && score == pool.count * 10 {achievements.append(GKAchievement.init(identifier: "PerfectALL"))}
        
        addAchievementProgress(achievements, progress: 100)
        
        if score > dbScore {
            UserDefaults.standard.set(score, forKey: view)
        }
    }
    
    func addAchievementProgress(_ achievements:[GKAchievement], progress:Double) -> Void {
        //Je uživatel přihlášen?
        guard GKLocalPlayer.local.isAuthenticated else { return }
        
        for item in achievements {
            item.percentComplete = progress
            item.showsCompletionBanner = true
        }
        
        GKAchievement.report(achievements, withCompletionHandler: { error in
            guard error == nil else {
                print("Error saving, \(error?.localizedDescription)")
                return
            }
            print("Done")
        })
    }
    
    var options:[Nation] = []
    var correctOption:Nation? = nil
    @Published var finish = false
    @Published var timer:Timer? = nil
    
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
