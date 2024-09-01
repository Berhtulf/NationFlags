//
//  NameToFlagErrorView.swift
//  NationFlags
//
//  Created by Martin Václavík on 09/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//
import SwiftUI

struct NameToFlagErrorView: View {
    @EnvironmentObject private var settings: GlobalSettings
    @Environment(\.presentationMode) private var presentationMode

    @StateObject private var viewModel = GameViewModel(withTimer: false)

    var body: some View {
        VStack {
            FlagImage(image: viewModel.correctOption?.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center)
                .padding(.horizontal)
            if !viewModel.options.isEmpty {
                ForEach(viewModel.options) { item in
                    Button(action: {
                        viewModel.pressedButtonFor(item: item)
                        if item == viewModel.correctOption {
                            viewModel.generateOptions(useDelay: true)
                            viewModel.disableAllButtons()
                        } else {
                            viewModel.disableButton(item: item)
                            viewModel.highlightCorrectOption()
                            viewModel.endGame()
                        }
                        viewModel.adjustScore(wasCorrect: item == viewModel.correctOption)
                    }, label: {
                        Text(LocalizedStringKey(item.name))
                    })
                    .buttonStyle(OptionButtonStyle(wasPressed: viewModel.pressedButtons.contains(item),
                                                   isCorrect: item == viewModel.correctOption,
                                                   showCorrect: viewModel.showCorrectOption))
                    .disabled(viewModel.disabledButtons.contains(item))
                }
            }
        }
        .navigationBarTitle("NameToFlag", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                viewModel.saveScore(score: viewModel.score, view: "NameToFlagError")
                presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                viewModel.saveScore(score: viewModel.score, view: "NameToFlagError")
                viewModel.playAgain()
            })
        }
    }
}

#Preview {
    NavigationView {
        NameToFlagErrorView()
    }
}
