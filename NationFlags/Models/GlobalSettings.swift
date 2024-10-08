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
    static var shared = GlobalSettings()

    var updateDate: Date = Date(timeIntervalSince1970: 1594029613)
    // Prodleva před načtením dalších otázek
    let nextDelay = 0.5
    let learnDelay = 1.5
    
    @Published var regions: Set<String> = []
    @Published var finish = false
    @Published var img: [Int] = [0, 0, 0, 0, 0]
    var imgName: String {
        img.map { String($0) }.joined()
    }
    
    func toggleRegion(_ region: MapRegion) {
        if regions.contains(region.rawValue) {
            regions.remove(region.rawValue)
        } else {
            regions.insert(region.rawValue)
        }
    }
    
    func saveScore(maxScore: Int, score: Int, view: String) {
        var achievements = [GKAchievement]()
        achievements.append(GKAchievement.init(identifier: "FirstGamePlayed"))
        
        let dbScore = UserDefaults.standard.integer(forKey: view)
        
        if imgName == "10000" && score == maxScore { achievements.append(GKAchievement.init(identifier: "PerfectAME")) }
        if imgName == "01000" && score == maxScore { achievements.append(GKAchievement.init(identifier: "PerfectEU")) }
        if imgName == "00100" && score == maxScore { achievements.append(GKAchievement.init(identifier: "PerfectAFR")) }
        if imgName == "00010" && score == maxScore { achievements.append(GKAchievement.init(identifier: "PerfectAsia")) }
        if imgName == "00001" && score == maxScore { achievements.append(GKAchievement.init(identifier: "PerfectAUS")) }
        if imgName == "11111" && score == maxScore { achievements.append(GKAchievement.init(identifier: "PerfectALL")) }
        
        addAchievementProgress(achievements, progress: 100)
        
        if score > dbScore {
            UserDefaults.standard.set(score, forKey: view)
        }
    }
    
    func addAchievementProgress(_ achievements: [GKAchievement], progress: Double) {
        //Je uživatel přihlášen?
        guard GKLocalPlayer.local.isAuthenticated else { return }
        
        for item in achievements {
            item.percentComplete = progress
            item.showsCompletionBanner = true
        }
        
        GKAchievement.report(achievements) { error in
            if let er = error {
                print("Error saving, \(er.localizedDescription)")
                return
            }
        }
    }
}
