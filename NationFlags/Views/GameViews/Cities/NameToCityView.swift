//
//  NameToCityView.swift
//  Countries
//
//  Created by Martin Václavík on 06/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NameToCityView: View {
    @EnvironmentObject var settings: GlobalSettings
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = GameViewModel(withTimer: true)
    
    var body: some View {
        ZStack{
            VStack{
                ProgressBar()
                    .padding(10)
                Spacer()
                Text(LocalizedStringKey(viewModel.correctOption?.capital ?? ""))
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
            
        }.navigationBarTitle("StateToCity", displayMode: .inline)
        .onAppear(perform: viewModel.playAgain)
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(viewModel.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    viewModel.saveScore(score: viewModel.score, view: "NameToCity")
                    presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    viewModel.saveScore(score: viewModel.score, view: "NameToCity")
                    viewModel.playAgain()
                })
        }
    }
}

struct NameToCityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NameToCityView().environmentObject(GlobalSettings())
        }
    }
}
