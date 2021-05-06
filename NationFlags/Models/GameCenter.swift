//
//  GameCenter.swift
//  NationFlags
//
//  Created by Martin Václavík on 27/09/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import GameKit

class GameCenter: ObservableObject {
    let localPlayer = GKLocalPlayer.local
    var viewController: UIViewController?
    func authenticateUser() -> UIViewController? {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.location = .topLeading
            GKAccessPoint.shared.showHighlights = true
            
            self.viewController = vc
            
            GKAchievement.loadAchievements()
        }
        return viewController
    }
}
