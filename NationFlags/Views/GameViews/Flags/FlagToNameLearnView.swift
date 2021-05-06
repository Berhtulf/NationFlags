//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagToNameLearnView: View {
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
                            viewModel.disableAllButtons()
                            if item != viewModel.correctOption {
                                viewModel.highlightCorrectOption()
                            }
                            viewModel.generateOptions(useDelay: true, learnMode: true)
                            viewModel.adjustScoreWhileLearning(wasCorrect: item == viewModel.correctOption)
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
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>/<\(viewModel.pool.count)>"),
                  primaryButton: .destructive(Text("Back")) {
                    presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    viewModel.playAgain()
                })
        }
    }
}

struct FlagToNameLearnView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                FlagToNameLearnView().environmentObject(GlobalSettings())
            }
        }
    }
}
