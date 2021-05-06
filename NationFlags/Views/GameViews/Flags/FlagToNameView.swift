//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagToNameView: View {
    @EnvironmentObject var settings: GlobalSettings
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = GameViewModel(withTimer: true)
    
    var body: some View {
        ZStack{
            VStack{
                ProgressBar()
                    .padding(10)
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
                                }
                                viewModel.adjustScore(wasCorrect: item == viewModel.correctOption, deduct: true)
                            },label: {
                                GameConditionalFlagView(item: item,
                                                        isCorrect: item == viewModel.correctOption,
                                                        wasTapped: viewModel.pressedButtons.contains(item))
                            })
                            .disabled(viewModel.disabledButtons.contains(item))
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle("FlagToName", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    viewModel.saveScore(score: viewModel.score, view: "FlagToName")
                    presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    viewModel.saveScore(score: viewModel.score, view: "FlagToName")
                    viewModel.playAgain()
                })
        }
    }
}



struct FlagToNameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FlagToNameView()
                .environmentObject(GlobalSettings())
        }
    }
}
