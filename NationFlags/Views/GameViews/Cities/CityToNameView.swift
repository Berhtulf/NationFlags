//
//  capitalToFlagView.swift
//  Countries
//
//  Created by Martin Václavík on 24/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct CityToNameView: View {
    @EnvironmentObject private var settings: GlobalSettings
    @Environment(\.presentationMode) private var presentationMode

    @StateObject private var viewModel = GameViewModel(withTimer: true)

    var body: some View {
        ZStack {
            VStack {
                ProgressBar()
                    .padding(10)
                Spacer()
                Text(LocalizedStringKey(viewModel.correctOption?.name ?? ""))
                    .font(.title)
                    .lineLimit(1)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.005)
                    .padding(.horizontal)
                    .padding(.vertical, 7)
                Spacer()
                    .frame(height: 50)
                if !viewModel.options.isEmpty {
                    ForEach(viewModel.options) { item in
                        Button(action: {
                            viewModel.pressedButtonFor(item: item)
                            if item == viewModel.correctOption {
                                viewModel.generateOptions(useDelay: true)
                                viewModel.disableAllButtons()
                            } else {
                                viewModel.disableButton(item: item)
                            }
                            viewModel.adjustScore(wasCorrect: item == viewModel.correctOption, deduct: true)
                        }, label: {
                            Text(LocalizedStringKey(item.capital))
                        })
                        .buttonStyle(OptionButtonStyle(wasPressed: viewModel.pressedButtons.contains(item),
                                                       isCorrect: item == viewModel.correctOption))
                        .disabled(viewModel.disabledButtons.contains(item))
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle("CityToState", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                viewModel.saveScore(score: viewModel.score, view: "CityToName")
                presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                viewModel.saveScore(score: viewModel.score, view: "CityToName")
                viewModel.playAgain()
            })
        }
    }
}

#Preview {
    NavigationView {
        CityToNameView()
            .environmentObject(GlobalSettings())
            .environment(\.locale, Locale(identifier: "cs"))
    }
}
