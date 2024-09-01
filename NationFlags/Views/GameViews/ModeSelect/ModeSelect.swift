//
//  ModeSelect.swift
//  Countries
//
//  Created by Martin Václavík on 10/12/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ModeSelect: View {
    @EnvironmentObject private var viewModel: GameModeViewModel
    @State private var showHelp = false

    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("chooseMode").font(.headline)
                    Picker(selection: $viewModel.gameMode, label: Text("ModeSelect")) {
                        Text("Flags").tag(0)
                        Text("Capitals").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                }.padding()
                VStack {
                    MapSelectView()
                    ModeScrollView()
                }
                Spacer()
            }.transition(AnyTransition.move(edge: .top))
                .sheet(isPresented: $showHelp) {
                    VStack {
                        Image("HelpImage")
                            .resizable()
                            .padding()
                            .aspectRatio(contentMode: .fit)
                    }
                }
        }
        .navigationBarTitle("GameSettings", displayMode: .inline)
        .toolbar {
            Button {
                showHelp.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .padding()
            }
        }
        .onAppear {
            GlobalSettings.shared.finish = false
            AppStoreReviewPrompt.requestReviewIfAppropriate()
        }
    }
}

#Preview {
    NavigationView {
        ModeSelect().environmentObject(GlobalSettings())
    }
}
