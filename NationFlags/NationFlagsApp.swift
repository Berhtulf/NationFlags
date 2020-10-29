//
//  NationFlagsApp.swift
//  NationFlags
//
//  Created by Martin Václavík on 27/09/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

@main
struct NationFlagsApp: App {
    private var gameCenter = GameCenter()
    var body: some Scene {
        WindowGroup{
            MainScreen()
                .environmentObject(GlobalSettings())
                .onAppear{
                    gameCenter.authenticateUser()
                }
        }
    }
}
