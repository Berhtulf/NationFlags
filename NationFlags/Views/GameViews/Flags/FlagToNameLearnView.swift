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
    
    @State private var didTap0:Bool = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var disableAll:Bool = false
    @State private var score:Int = 0
    
    func playAgain() {
        settings.finish = false
        self.score = 0
        settings.history.removeAll()
        settings.generateOptions()
        self.resetButtons()
    }
    func resetButtons() {
        self.didTap0 = false
        self.didTap1 = false
        self.didTap2 = false
        self.didTap3 = false
        self.disableAll = false
    }
    
    var body: some View {
        VStack{
            Spacer()
            if settings.correctOption != nil { Text(LocalizedStringKey(settings.correctOption!.name))
                .font(.title)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.005)
                .padding(.horizontal)
                .padding(.vertical,7)
            }
            if (settings.options.count > 0) {
                VStack{
                    HStack{
                        Spacer()
                        if settings.options[0].name == settings.correctOption?.name {
                            if self.didTap0 == true {
                                GameCorrectFlag(image: settings.options[0].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(nation: settings.options[0])
                            }else{
                                GameFlagImage(image: settings.options[0].image)
                                    .onTapGesture {
                                        self.didTap0 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.settings.generateOptions()
                                            self.resetButtons()
                                        }
                                }
                            }
                        }
                        else{
                            if self.didTap0 == true {
                                GameWrongFlag(image: settings.options[0].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: settings.options[0].image)
                                }else{
                                    GameFlagImage(image: settings.options[0].image)
                                        .onTapGesture {
                                            self.didTap0 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.settings.generateOptions()
                                                self.resetButtons()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                        if settings.options[1].name == settings.correctOption?.name {
                            if self.didTap1 == true {
                                GameCorrectFlag(image: settings.options[1].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(nation: settings.options[1])
                            }else{
                                GameFlagImage(image: settings.options[1].image)
                                    .onTapGesture {
                                        self.didTap1 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.settings.generateOptions()
                                            self.resetButtons()
                                        }
                                }
                            }
                            
                        }
                        else{
                            if self.didTap1 == true {
                                GameWrongFlag(image: settings.options[1].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: settings.options[1].image)
                                }else{
                                    GameFlagImage(image: settings.options[1].image)
                                        .onTapGesture {
                                            self.didTap1 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.settings.generateOptions()
                                                self.resetButtons()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        if settings.options[2].name == settings.correctOption?.name {
                            if self.didTap2 == true {
                                GameCorrectFlag(image: settings.options[2].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(nation: settings.options[2])
                            }else{
                                GameFlagImage(image: settings.options[2].image)
                                    .onTapGesture {
                                        self.didTap2 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.settings.generateOptions()
                                            self.resetButtons()
                                        }
                                }
                            }
                        }
                        else{
                            if self.didTap2 == true {
                                GameWrongFlag(image: settings.options[2].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: settings.options[2].image)
                                }else{
                                    GameFlagImage(image: settings.options[2].image)
                                        .onTapGesture {
                                            self.didTap2 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.settings.generateOptions()
                                                self.resetButtons()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                        if settings.options[3].name == settings.correctOption?.name {
                            if self.didTap3 == true {
                                GameCorrectFlag(image: settings.options[3].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(nation: settings.options[3])
                            }else{
                                GameFlagImage(image: settings.options[3].image)
                                    .onTapGesture {
                                        self.didTap3 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.settings.generateOptions()
                                            self.resetButtons()
                                        }
                                }
                            }
                        }
                        else{
                            if self.didTap3 == true {
                                GameWrongFlag(image: settings.options[3].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: settings.options[3].image)
                                }else{
                                    GameFlagImage(image: settings.options[3].image)
                                        .onTapGesture {
                                            self.didTap3 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.settings.generateOptions()
                                                self.resetButtons()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle("FlagToName", displayMode: .inline)
        .onAppear() {
            self.playAgain()
        }
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>/<\(self.settings.pool.count)>"),
                  primaryButton: .destructive(Text("Back")) {
                    self.settings.saveScore(score: Int64(self.score), view: "FlagToNameError")
                    self.presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    self.settings.saveScore(score: Int64(self.score), view: "FlagToNameError")
                    self.playAgain()
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
