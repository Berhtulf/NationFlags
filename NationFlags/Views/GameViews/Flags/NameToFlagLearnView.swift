//
//  NameToFlagErrorView.swift
//  NationFlags
//
//  Created by Martin Václavík on 09/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//
import SwiftUI

struct NameToFlagLearnView: View {
    @EnvironmentObject var settings: GlobalSettings
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = GameViewModel(withTimer: false)
    
    var body: some View {
        VStack{
            Spacer()
            FlagImage(image: viewModel.correctOption?.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center)
                .padding(.horizontal)
            if (!viewModel.options.isEmpty) {
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
                        Text(LocalizedStringKey(item.name))
                    })
                    .buttonStyle(OptionButtonStyle(wasPressed: viewModel.pressedButtons.contains(item),
                                                   isCorrect: item == viewModel.correctOption,
                                                   showCorrect: viewModel.showCorrectOption))
                    .disabled(viewModel.disabledButtons.contains(item))
                }
            }
            Spacer()
        }.navigationBarTitle("NameToFlag", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
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

struct NameToFlagLearnView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{ NameToFlagLearnView().environmentObject(GlobalSettings())
            }
        }
        
    }
}
