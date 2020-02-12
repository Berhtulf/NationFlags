//
//  NameToCityErrorView.swift
//  Countries
//
//  Created by Martin Václavík on 06/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NameToCityErrorView: View {
    @EnvironmentObject var settings: UserSettings
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
            if finish {
                Spacer()
                VStack(alignment: .center){
                    Text("Game over!")
                        .font(.largeTitle)
                    HStack {
                        Text("score")
                        Text("\(score)")
                        Text("points")
                    }
                    VStack{
                        Button(action: {
                            self.playAgain()
                        }) {
                            Text("SaveAndPlay")
                                .modifier(MainMenuButton())
                                .font(.title)
                        }
                    }
                }.padding()
                Spacer()
            }
            else{
                Spacer()
                Text(LocalizedStringKey(correctOption?.capital ?? ""))
                    .font(.system(size: 25))
                    .lineLimit(1)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.005)
                    .padding(.horizontal)
                    .padding(.vertical,7)
                Spacer()
                    .frame(height: 50)
                if (options.count > 0) {
                    if options[0].name == self.correctOption?.name {
                        Button(action: {
                            self.didTap0 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            if self.didTap0 {
                                Text(LocalizedStringKey(options[0].name))
                                    .modifier(CorrectButton())
                            }else{
                                Text(LocalizedStringKey(options[0].name))
                                    .modifier(GameButton())
                            }
                        }
                            .disabled(self.didTap0 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap0 = true
                                self.disableAll = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                    self.finish = true
                                }
                            }) {
                                if self.didTap0 {
                                    Text(LocalizedStringKey(options[0].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[0].name))
                                        .modifier(GameButton())
                                }
                            }
                                .disabled(self.didTap0 ? true : false)
                        }else{
                            if self.didTap0 {
                                Text(LocalizedStringKey(options[0].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[0].name))
                                    .modifier(GameButton())
                            }
                        }
                    }
                    if options[1].name == self.correctOption?.name {
                        Button(action: {
                            self.didTap1 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            if self.didTap1 {
                                Text(LocalizedStringKey(options[1].name))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(options[1].name))
                                    .modifier(GameButton())
                            }
                        }
                            .disabled(self.didTap1 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap1 = true
                                self.disableAll = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                    self.finish = true
                                }
                            }) {
                                if self.didTap1 {
                                    Text(LocalizedStringKey(options[1].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[1].name))
                                        .modifier(GameButton())
                                }
                            }
                            .disabled(self.didTap1 ? true : false)
                        }else{
                            if self.didTap1 {
                                Text(LocalizedStringKey(options[1].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[1].name))
                                    .modifier(GameButton())
                            }
                        }
                    }
                    if options[2].name == self.correctOption?.name {
                        Button(action: {
                            self.didTap2 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            if self.didTap2 {
                                Text(LocalizedStringKey(options[2].name))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(options[2].name))
                                    .modifier(GameButton())
                            }
                        }
                            .disabled(self.didTap2 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap2 = true
                                self.disableAll = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                    self.finish = true
                                }
                            }) {
                                if self.didTap2 {
                                    Text(LocalizedStringKey(options[2].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[2].name))
                                        .modifier(GameButton())
                                }
                            }
                                .disabled(self.didTap2 ? true : false)
                        }else{
                            if self.didTap2{
                                Text(LocalizedStringKey(options[2].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[2].name))
                                    .modifier(GameButton())
                            }
                        }
                    }
                    if options[3].name == self.correctOption?.name {
                        Button(action: {
                            self.didTap3 = true
                            self.disableAll = true
                            self.score += 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                self.generateOptions()
                            }
                        }) {
                            if self.didTap3 {
                                Text(LocalizedStringKey(options[3].name))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(options[3].name))
                                    .modifier(GameButton())
                            }
                        }
                            .disabled(self.didTap3 ? true : false)
                    }
                    else{
                        if !self.disableAll {
                            Button(action: {
                                self.didTap3 = true
                                self.disableAll = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                    self.finish = true
                                }
                            }) {
                                if self.didTap3 {
                                    Text(LocalizedStringKey(options[3].name))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[3].name))
                                        .modifier(GameButton())
                                }
                            }
                                .disabled(self.didTap3 ? true : false)
                        }else{
                            if self.didTap3 {
                                Text(LocalizedStringKey(options[3].name))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[3].name))
                                    .modifier(GameButton())
                            }
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarTitle("Capitals", displayMode: .inline)
            .onAppear() {
                self.playAgain()
        }
    }
}

struct NameToCityErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NameToCityErrorView().environmentObject(UserSettings())
        }
    }
}
