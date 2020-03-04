//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagToNameLearnView: View {
    @EnvironmentObject var settings: UserSettings
    @Environment(\.presentationMode) var presentationMode
    @State private var options:[Nation] = []
    @State private var correctOption:Nation?
    @State private var history = Set<Nation?>()
    
    @State private var didTap0:Bool = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var disableAll:Bool = false
    @State private var finish = false
    @State private var score:Int = 0
    
    func generateOptions() {
        if history.count < settings.pool.count {
            self.resetButtons()
            // nesmí se opakovat odpověd
            repeat{
                self.correctOption = settings.pool.randomElement()
            } while history.contains(self.correctOption)
            
            var options = Set<Nation>()
            guard let correctOption = self.correctOption else { return }
            options.insert(correctOption)
            history.insert(correctOption)
            while options.count < 4 {
                if let option = settings.pool.randomElement() {
                    options.insert(option)
                }
            }
            self.options = options.map({$0}).shuffled()
        }else{
            self.finish = true
        }
    }
    func playAgain() {
        self.finish = false
        self.score = 0
        self.history.removeAll()
        self.generateOptions()
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
            if correctOption != nil { Text(LocalizedStringKey(correctOption!.name))
                .font(.title)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.005)
                .padding(.horizontal)
                .padding(.vertical,7)
            }
            if (options.count > 0) {
                VStack{
                    HStack{
                        Spacer()
                        if options[0].name == self.correctOption?.name {
                            if self.didTap0 == true {
                                GameCorrectFlag(image: options[0].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(image: options[0].image)
                            }else{
                                GameFlagImage(image: options[0].image)
                                    .onTapGesture {
                                        self.didTap0 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.generateOptions()
                                        }
                                }
                            }
                        }
                        else{
                            if self.didTap0 == true {
                                GameWrongFlag(image: options[0].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: options[0].image)
                                }else{
                                    GameFlagImage(image: options[0].image)
                                        .onTapGesture {
                                            self.didTap0 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.generateOptions()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                        if options[1].name == self.correctOption?.name {
                            if self.didTap1 == true {
                                GameCorrectFlag(image: options[1].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(image: options[1].image)
                            }else{
                                GameFlagImage(image: options[1].image)
                                    .onTapGesture {
                                        self.didTap1 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.generateOptions()
                                        }
                                }
                            }
                            
                        }
                        else{
                            if self.didTap1 == true {
                                GameWrongFlag(image: options[1].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: options[1].image)
                                }else{
                                    GameFlagImage(image: options[1].image)
                                        .onTapGesture {
                                            self.didTap1 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.generateOptions()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        if options[2].name == self.correctOption?.name {
                            if self.didTap2 == true {
                                GameCorrectFlag(image: options[2].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(image: options[2].image)
                            }else{
                                GameFlagImage(image: options[2].image)
                                    .onTapGesture {
                                        self.didTap2 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.generateOptions()
                                        }
                                }
                            }
                        }
                        else{
                            if self.didTap2 == true {
                                GameWrongFlag(image: options[2].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: options[2].image)
                                }else{
                                    GameFlagImage(image: options[2].image)
                                        .onTapGesture {
                                            self.didTap2 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.generateOptions()
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                        if options[3].name == self.correctOption?.name {
                            if self.didTap3 == true {
                                GameCorrectFlag(image: options[3].image)
                            }else if self.disableAll == true{
                                ShowCorrectFlag(image: options[3].image)
                            }else{
                                GameFlagImage(image: options[3].image)
                                    .onTapGesture {
                                        self.didTap3 = true
                                        self.disableAll = true
                                        self.score += 1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                            self.generateOptions()
                                        }
                                }
                            }
                        }
                        else{
                            if self.didTap3 == true {
                                GameWrongFlag(image: options[3].image)
                            }else{
                                if self.disableAll == true {
                                    GameFlagImage(image: options[3].image)
                                }else{
                                    GameFlagImage(image: options[3].image)
                                        .onTapGesture {
                                            self.didTap3 = true
                                            self.disableAll = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.learnDelay) {
                                                self.generateOptions()
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
        .alert(isPresented: $finish) {
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
                FlagToNameLearnView().environmentObject(UserSettings())
            }
        }
    }
}