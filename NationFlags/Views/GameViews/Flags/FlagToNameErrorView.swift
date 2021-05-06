//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagToNameErrorView: View {
    @EnvironmentObject var settings: GlobalSettings
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = GameViewModel(withTimer: false)
    
    var body: some View {
        VStack{
            Spacer()
            if let correctOption = viewModel.correctOption {
                Text(LocalizedStringKey(correctOption.name))
                .font(.title)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.005)
                .padding(.horizontal)
                .padding(.vertical,7)
            }
            if (!viewModel.options.isEmpty) {
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())]){
                    ForEach(viewModel.options){ item in
                        Button(action: {
                            viewModel.pressedButtonFor(item: item)
                            if item == viewModel.correctOption {
                                viewModel.generateOptions(useDelay: true)
                                viewModel.disableAllButtons()
                            }else{
                                viewModel.disableButton(item: item)
                                viewModel.highlightCorrectOption()
                                viewModel.endGame()
                            }
                            viewModel.adjustScore(wasCorrect: item == viewModel.correctOption, deduct: true)
                        },label: {
                            GameConditionalFlagView(item: item,
                                                    isCorrect: item == viewModel.correctOption,
                                                    showCorrect: viewModel.showCorrectOption,
                                                    wasTapped: viewModel.pressedButtons.contains(item))
                        })
                        .disabled(viewModel.disabledButtons.contains(item))
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle("FlagToName", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain )
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    settings.saveScore(score: viewModel.score, view: "FlagToNameError")
                    presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    settings.saveScore(score: viewModel.score, view: "FlagToNameError")
                    viewModel.playAgain()
                })
        }
    }
}

struct FlagToNameErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                FlagToNameErrorView().environmentObject(GlobalSettings())
            }
        }
    }
}
