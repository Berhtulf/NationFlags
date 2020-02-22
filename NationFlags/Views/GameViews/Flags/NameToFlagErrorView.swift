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
            CircleImage(image: correctOption?.image).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center).padding(.horizontal)
            if (options.count > 0) {
                if options[0].name == self.correctOption?.name {
                    if self.disableAll {
                        if self.didTap0 {
                            Text(LocalizedStringKey(options[0].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(options[0].name))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap0 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            Text(LocalizedStringKey(options[0].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap0 {
                            Text(LocalizedStringKey(options[0].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(options[0].name))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap0 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(options[0].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                if options[1].name == self.correctOption?.name {
                    if self.disableAll {
                        if self.didTap1 {
                            Text(LocalizedStringKey(options[1].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(options[1].name))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap1 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            Text(LocalizedStringKey(options[1].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap1 {
                            Text(LocalizedStringKey(options[1].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(options[1].name))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap1 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(options[1].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                if options[2].name == self.correctOption?.name {
                    if self.disableAll {
                        if self.didTap2 {
                            Text(LocalizedStringKey(options[2].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(options[2].name))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap2 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            Text(LocalizedStringKey(options[2].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap2 {
                            Text(LocalizedStringKey(options[2].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(options[2].name))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap2 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(options[2].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                if options[3].name == self.correctOption?.name {
                    if self.disableAll {
                        if self.didTap3 {
                            Text(LocalizedStringKey(options[3].name))
                                .modifier(CorrectButton())
                        }else{
                            Text(LocalizedStringKey(options[3].name))
                                .modifier(ShowCorrectButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap3 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            Text(LocalizedStringKey(options[3].name))
                                .modifier(BasicButton())
                        }
                    }
                }
                else{
                    if self.disableAll {
                        if self.didTap3 {
                            Text(LocalizedStringKey(options[3].name))
                                .modifier(WrongButton())
                        }else{
                            Text(LocalizedStringKey(options[3].name))
                                .modifier(BasicButton())
                        }
                    }else{
                        Button(action: {
                            self.didTap3 = true
                            self.disableAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.finish = true
                            }
                        }) {
                            Text(LocalizedStringKey(options[3].name))
                                .modifier(BasicButton())
                        }
                    }
                }
            }
            Spacer()
        }.navigationBarTitle("Names", displayMode: .inline)
            .onAppear() {
                self.playAgain()
        }
        .alert(isPresented: $finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>"), primaryButton: .destructive(Text("Back")) {
                self.settings.saveScore(score: Int64(self.score), view: "NameToFlagError")
                self.presentationMode.wrappedValue.dismiss()
                }, secondaryButton: .default(Text("SaveAndPlay")) {
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
