//
//  NameToFlagErrorView.swift
//  NationFlags
//
//  Created by Martin Václavík on 09/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//
import SwiftUI

struct NameToFlagErrorView: View {
    @EnvironmentObject var settings: UserSettings
    @Environment(\.presentationMode) var presentationMode
    
    @State private var didTap0:Bool = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var disableAll:Bool = false
    
    @State private var score:Int = 0
    
    func playAgain() {
        self.score = 0
        settings.history.removeAll()
        settings.generateOptions()
        settings.finish = false
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
            FlagImage(image: settings.correctOption?.image).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center).padding(.horizontal)
            if (settings.options.count > 0) {
                if settings.options[0].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap0 {
                            Text(LocalizedStringKey(settings.options[0].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[0].name))
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
                            Text(LocalizedStringKey(settings.options[0].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap0 {
                            Text(LocalizedStringKey(settings.options[0].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[0].name))
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
                            Text(LocalizedStringKey(settings.options[0].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                if settings.options[1].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap1 {
                            Text(LocalizedStringKey(settings.options[1].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[1].name))
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
                            Text(LocalizedStringKey(settings.options[1].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap1 {
                            Text(LocalizedStringKey(settings.options[1].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[1].name))
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
                            Text(LocalizedStringKey(settings.options[1].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                if settings.options[2].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap2 {
                            Text(LocalizedStringKey(settings.options[2].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[2].name))
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
                            Text(LocalizedStringKey(settings.options[2].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap2 {
                            Text(LocalizedStringKey(settings.options[2].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[2].name))
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
                            Text(LocalizedStringKey(settings.options[2].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                if settings.options[3].name == settings.correctOption?.name {
                    if self.disableAll {
                        if self.didTap3 {
                            Text(LocalizedStringKey(settings.options[3].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[3].name))
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
                            Text(LocalizedStringKey(settings.options[3].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap3 {
                            Text(LocalizedStringKey(settings.options[3].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(settings.options[3].name))
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
                            Text(LocalizedStringKey(settings.options[3].name))
                                .modifier(BasicButton())
                        }
                    }
                }
            }
            Spacer()
        }.navigationBarTitle("NameToFlag", displayMode: .inline)
            .onAppear() {
                self.playAgain()
        }
        .alert(isPresented: $settings.finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    self.settings.saveScore(score: Int64(self.score), view: "NameToFlagError")
                    self.presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    self.settings.saveScore(score: Int64(self.score), view: "NameToFlagError")
                    self.playAgain()
                })
        }
    }
}

struct NameToFlagErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                NameToFlagErrorView().environmentObject(UserSettings()).environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            }
        }
        
    }
}
