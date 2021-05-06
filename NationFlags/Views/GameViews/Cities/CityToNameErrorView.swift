//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct CityToNameErrorView: View {
    @EnvironmentObject var settings: GlobalSettings
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = GameViewModel(withTimer: false)
    
    var body: some View {
        VStack{
            Spacer()
            Text(LocalizedStringKey(viewModel.correctOption?.name ?? ""))
                .font(.title)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.005)
                .padding(.horizontal)
                .padding(.vertical,7)
            Spacer()
                .frame(height: 50)
            if (!viewModel.options.isEmpty) {
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
                        viewModel.adjustScore(wasCorrect: item == viewModel.correctOption)
                    },label: {
                        Text(LocalizedStringKey(item.capital))
                    })
                    .buttonStyle(OptionButtonStyle(wasPressed: viewModel.pressedButtons.contains(item),
                                                   isCorrect: item == viewModel.correctOption,
                                                   showCorrect: viewModel.showCorrectOption))
                    .disabled(viewModel.disabledButtons.contains(item))
                }
            }
            Spacer()
        }
        .navigationBarTitle("CityToState", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    viewModel.saveScore(score: viewModel.score, view: "CityToNameError")
                    presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    viewModel.saveScore(score: viewModel.score, view: "CityToNameError")
                    viewModel.playAgain()
                })
        }
    }
}

struct CityToNameErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                CityToNameErrorView().environmentObject(GlobalSettings())
            }
        }
        
    }
}
