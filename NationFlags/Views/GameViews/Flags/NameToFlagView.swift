//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NameToFlagView: View {
    @EnvironmentObject var settings: GlobalSettings
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = GameViewModel(withTimer: true)
    
    var body: some View {
        ZStack{
            VStack{
                ProgressBar()
                    .padding(.top, 10)
                    .padding(.horizontal)
                Spacer()
                FlagImage(image: viewModel.correctOption?.image)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250, alignment: .center)
                    .padding(.horizontal)
                if (!viewModel.options.isEmpty) {
                    ForEach(viewModel.options){ item in
                        Button(action: {
                            viewModel.pressedButtonFor(item: item)
                            if item == viewModel.correctOption {
                                viewModel.generateOptions(useDelay: true)
                                viewModel.disableAllButtons()
                            }else{
                                viewModel.disableButton(item: item)
                            }
                            viewModel.adjustScore(wasCorrect: item == viewModel.correctOption, deduct: true)
                        },label: {
                            Text(LocalizedStringKey(item.name))
                        })
                        .buttonStyle(OptionButtonStyle(wasPressed: viewModel.pressedButtons.contains(item),
                                                       isCorrect: item == viewModel.correctOption))
                        .disabled(viewModel.disabledButtons.contains(item))
                    }
                }
                Spacer()
            }
        }.navigationBarTitle("NameToFlag", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    viewModel.saveScore(score: viewModel.score, view: "NameToFlag")
                    presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    viewModel.saveScore(score: viewModel.score, view: "NameToFlag")
                    viewModel.playAgain()
                  })
        }
    }
}

struct NameToFlagView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NameToFlagView()
        }
    }
}
