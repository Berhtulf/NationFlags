//
//  NationFlagsApp.swift
//  NationFlags
//
//  Created by Martin Václavík on 27/09/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import GameKit
import UIKit

@main
struct NationFlagsApp: App {
    private var gameCenter = GameCenter()
    
    var body: some Scene {
        WindowGroup{
            MainScreen()
                .environmentObject(GlobalSettings())
        }
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        //        super.viewDidLoad()
        authenticateUser()
    }
    let localPlayer = GKLocalPlayer.local
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            if let vc = vc {
                self.present(vc, animated: true, completion: nil)
            }
            if #available(iOS 14.0, *) {
                GKAccessPoint.shared.location = .topLeading
                GKAccessPoint.shared.showHighlights = true
                GKAccessPoint.shared.isActive = false
            }
        }
    }
}
struct GameCenterManager: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<GameCenterManager>) -> ViewController {
        let viewController = ViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<GameCenterManager>) {
    }
}
