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
	@EnvironmentObject var settings: GlobalSettings
	private var gameCenter = GameCenter()
	
	var body: some View {
		NavigationView{
			ZStack{
				GameCenterManager()
					.allowsHitTesting(false)
				VStack {
					Spacer()
					Image("Icon")
						.resizable()
						.padding()
						.aspectRatio(contentMode: .fit)
						.frame(height:245)
						.shadow(radius: 10)
					Text("Countries").font(.largeTitle)
						.padding(.vertical,40)
					NavigationLink(destination: ModeSelect()){
						Text("play")
							.modifier(MainMenuButton())
					}.font(.title)
					NavigationLink(destination: NationList()) {
						Text("list")
							.modifier(MainMenuButton())
					}.font(.title)
					Spacer()
				}.edgesIgnoringSafeArea(.all)
				.onAppear{
					print(Nation.list.count)
					GKAccessPoint.shared.isActive = true
				}
				
			}
		}
	}
}

struct MainScreen_Previews: PreviewProvider {
	static var previews: some View {
		MainScreen().environmentObject(GlobalSettings())
	}
}
