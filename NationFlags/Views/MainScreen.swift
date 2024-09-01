//
//  MainScreen.swift
//  Countries
//
//  Created by Martin Václavík on 01/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI
import MessageUI
import GameKit

struct MainScreen: View {
	@StateObject private var gameModel = GameModeViewModel()
	
	var body: some View {
		NavigationView {
			ZStack {
				GameCenterManager()
					.allowsHitTesting(false)
				VStack {
					Spacer()
					Image("Icon")
						.resizable()
						.padding()
						.aspectRatio(contentMode: .fit)
						.frame(height: 245)
						.shadow(radius: 10)
					Text("Countries")
						.font(.largeTitle)
						.padding(.vertical, 40)
					NavigationLink(
						destination:
							ModeSelect()
							.environmentObject(gameModel)
					) {
						Text("play")
							.modifier(MainMenuButton())
							.font(.title2)
					}
					NavigationLink(destination: NationList()) {
						Text("list")
							.modifier(MainMenuButton())
					}.font(.title2)
					Spacer()
				}
				.edgesIgnoringSafeArea(.all)
				.onAppear {
					GKAccessPoint.shared.isActive = true
				}
			}
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

#Preview {
	MainScreen()
		.environmentObject(GlobalSettings())
}
