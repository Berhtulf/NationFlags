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
    
    @State private var didTap0:Bool = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var disableAll:Bool = false
    
    @State private var score:Int = 0
    @State private var time:Int = 60

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.settings.timer = timer
            self.time -= 1
            if (self.time <= 0) {
                self.settings.timer?.invalidate()
                self.disableAll = true
                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                    self.settings.finish = true
                }
            }
        }
    }
    func playAgain() {
        self.settings.timer?.invalidate()
        settings.finish = false
        self.score = 0
        settings.history.removeAll()
        self.time = 60
        settings.generateOptions()
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
                ProgressBar(value: $time).padding(.top, 10).padding(.horizontal)
                Spacer()
                FlagImage(image: settings.correctOption?.image).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250, alignment: .center).padding(.horizontal)
                if (settings.options.count > 0) {
                    if settings.options[0].name == settings.correctOption?.name {
                        Button(action: {
                            self.didTap0 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            if self.didTap0 {
                                Text(LocalizedStringKey(settings.options[0].name))
                                    .modifier(CorrectButton())
                            }else{
                                Text(LocalizedStringKey(settings.options[0].name))
                                    .modifier(BasicButton())
                            }
                        }
                        .disabled(self.didTap0 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap0 = true
                                self.score -= 5
                            }) {
                                if self.didTap0 {
                                    Text(LocalizedStringKey(settings.options[0].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(settings.options[0].name))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap0 ? true : false)
                        }else{
                            if self.didTap0 {
                                Text(LocalizedStringKey(settings.options[0].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(settings.options[0].name))
                                    .modifier(BasicButton())
                            }
                        }
                    }
                    if settings.options[1].name == settings.correctOption?.name {
                        Button(action: {
                            self.didTap1 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            if self.didTap1 {
                                Text(LocalizedStringKey(settings.options[1].name))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(settings.options[1].name))
                                    .modifier(BasicButton())
                            }
                        }
                        .disabled(self.didTap1 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap1 = true
                                self.score -= 5
                            }) {
                                if self.didTap1 {
                                    Text(LocalizedStringKey(settings.options[1].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(settings.options[1].name))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap1 ? true : false)
                        }else{
                            if self.didTap1 {
                                Text(LocalizedStringKey(settings.options[1].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(settings.options[1].name))
                                    .modifier(BasicButton())
                            }
                        }
                    }
                    if settings.options[2].name == settings.correctOption?.name {
                        Button(action: {
                            self.didTap2 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            if self.didTap2 {
                                Text(LocalizedStringKey(settings.options[2].name))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(settings.options[2].name))
                                    .modifier(BasicButton())
                            }
                        }
                        .disabled(self.didTap2 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap2 = true
                                self.score -= 5
                            }) {
                                if self.didTap2 {
                                    Text(LocalizedStringKey(settings.options[2].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(settings.options[2].name))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap2 ? true : false)
                        }else{
                            if self.didTap2 {
                                Text(LocalizedStringKey(settings.options[2].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(settings.options[2].name))
                                    .modifier(BasicButton())
                            }
                        }
                    }
                    if settings.options[3].name == settings.correctOption?.name {
                        Button(action: {
                            self.didTap3 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            if self.didTap3 {
                                Text(LocalizedStringKey(settings.options[3].name))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(settings.options[3].name))
                                    .modifier(BasicButton())
                            }
                        }
                        .disabled(self.didTap3 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap3 = true
                                self.score -= 5
                            }) {
                                if self.didTap3 {
                                    Text(LocalizedStringKey(settings.options[3].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(settings.options[3].name))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap3 ? true : false)
                        }else{
                            if self.didTap3 {
                                Text(LocalizedStringKey(settings.options[3].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(settings.options[3].name))
                                    .modifier(BasicButton())
                            }
                        }
                    }
                }
                Spacer()
            }
            
        }.navigationBarTitle("NameToFlag", displayMode: .inline)
            .onAppear() {
                self.playAgain()
        }
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    self.settings.saveScore(score: Int64(self.score), view: "NameToFlag")
                    self.presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    self.settings.saveScore(score: Int64(self.score), view: "NameToFlag")
                    self.playAgain()
                })
        }
    }
}

struct NameToFlagView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                NameToFlagView().environmentObject(GlobalSettings())
            }
        }
    }
}
