//
//  GameView.swift
//  Countries
//
//  Created by Martin Václavík on 03/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct FlagToNameView: View {
    @EnvironmentObject var settings: UserSettings
    @Environment(\.presentationMode) var presentationMode
    
    @State private var didTap0:Bool = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var disableAll:Bool = false
    @State private var score:Int = 0
    @State private var timer:Int = 60
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timer -= 1
            if (self.timer <= 0) {
                timer.invalidate()
                self.disableAll = true
                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                    self.settings.finish = true
                }
            }
        }
    }
    func playAgain() {
        self.score = 0
        settings.history.removeAll()
        self.timer = 60
        settings.generateOptions()
        self.settings.finish = false
        self.resetButtons()
        self.startTimer()
    }
    func resetButtons() {
        self.didTap0 = false
        self.didTap1 = false
        self.didTap2 = false
        self.didTap3 = false
        self.disableAll = false
    }
    
    var body: some View {
        ZStack{
            VStack{
                if  settings.correctOption != nil { Text(LocalizedStringKey(settings.correctOption!.name))
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
                                }else{
                                    GameFlagImage(image: settings.options[0].image)
                                        .onTapGesture {
                                            self.didTap0 = true
                                            self.disableAll = true
                                            self.score += 10
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                                self.settings.generateOptions()
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
                                                self.score -= 5
                                        }
                                    }
                                }
                            }
                            Spacer()
                            if settings.options[1].name == settings.correctOption?.name {
                                if self.didTap1 == true {
                                    GameCorrectFlag(image: settings.options[1].image)
                                }else{
                                    GameFlagImage(image: settings.options[1].image)
                                        .onTapGesture {
                                            self.didTap1 = true
                                            self.disableAll = true
                                            self.score += 10
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                                self.settings.generateOptions()
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
                                                self.score -= 5
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }.padding(.vertical)
                        HStack{
                            Spacer()
                            if settings.options[2].name == settings.correctOption?.name {
                                if self.didTap2 == true {
                                    GameCorrectFlag(image: settings.options[2].image)
                                }else{
                                    GameFlagImage(image: settings.options[2].image)
                                        .onTapGesture {
                                            self.didTap2 = true
                                            self.disableAll = true
                                            self.score += 10
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                                self.settings.generateOptions()
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
                                                self.score -= 5
                                        }
                                    }
                                }
                            }
                            Spacer()
                            if settings.options[3].name == settings.correctOption?.name {
                                if self.didTap3 == true {
                                    GameCorrectFlag(image: settings.options[3].image)
                                }else{
                                    GameFlagImage(image: settings.options[3].image)
                                        .onTapGesture {
                                            self.didTap3 = true
                                            self.disableAll = true
                                            self.score += 10
                                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                                self.settings.generateOptions()
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
                                                self.score -= 5
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }.padding(.vertical)
                    }
                }
            }
            VStack{
                ProgressBar(value: $timer).padding(10)
                Spacer()
            }
        }
        .navigationBarTitle("FlagToName", displayMode: .inline)
        .onAppear() {
            self.playAgain()
        }
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    self.settings.saveScore(score: Int64(self.score), view: "FlagToName")
                    self.presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    self.settings.saveScore(score: Int64(self.score), view: "FlagToName")
                    self.playAgain()
                })
        }
    }
}

struct FlagToNameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FlagToNameView().environmentObject(UserSettings())
        }
    }
}
