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
        resetButtons()
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
            Text(LocalizedStringKey(settings.correctOption?.name ?? ""))
                .font(.title)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.005)
                .padding(.horizontal)
                .padding(.vertical,7)
            Spacer()
                .frame(height: 50)
            if (settings.options.count > 0) {
                if settings.options[0].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap0 {
                            Text(LocalizedStringKey(settings.options[0].capital))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[0].capital))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap0 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[0].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap0 {
                            Text(LocalizedStringKey(settings.options[0].capital))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[0].capital))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap0 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[0].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                if settings.options[1].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap1 {
                            Text(LocalizedStringKey(settings.options[1].capital))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[1].capital))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap1 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[1].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap1 {
                            Text(LocalizedStringKey(settings.options[1].capital))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[1].capital))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap1 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[1].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                if settings.options[2].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap2 {
                            Text(LocalizedStringKey(settings.options[2].capital))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[2].capital))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap2 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[2].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap2 {
                            Text(LocalizedStringKey(settings.options[2].capital))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[2].capital))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap2 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[2].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                if settings.options[3].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap3 {
                            Text(LocalizedStringKey(settings.options[3].capital))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[3].capital))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap3 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.generateOptions()
                                self.resetButtons()
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[3].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap3 {
                            Text(LocalizedStringKey(settings.options[3].capital))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[3].capital))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap3 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.settings.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(settings.options[3].capital))
                                .modifier(BasicButton())
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle("CityToState", displayMode: .inline)
        .onAppear() {
            self.playAgain()
        }
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    self.settings.saveScore(score: Int64(self.score), view: "CityToNameError")
                    self.presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    self.settings.saveScore(score: Int64(self.score), view: "CityToNameError")
                    self.playAgain()
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
