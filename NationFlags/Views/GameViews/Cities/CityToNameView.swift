//
//  capitalToFlagView.swift
//  Countries
//
//  Created by Martin Václavík on 24/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct CityToNameView: View {
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
    @State private var timer:Int = 60
    
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
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timer -= 1
            if (self.timer <= 0) {
                timer.invalidate()
                self.disableAll = true
                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                    self.finish = true
                }
            }
        }
    }
    func playAgain() {
        self.finish = false
        self.score = 0
        self.history.removeAll()
        self.timer = 60
        self.generateOptions()
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
                Spacer()
                Text(LocalizedStringKey(correctOption?.name ?? ""))
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
                                Text(LocalizedStringKey(options[0].capital))
                                    .modifier(CorrectButton())
                            }else{
                                Text(LocalizedStringKey(options[0].capital))
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                }
                            }) {
                                if self.didTap0 {
                                    Text(LocalizedStringKey(options[0].capital))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[0].capital))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap0 ? true : false)
                        }else{
                            if self.didTap0 {
                                Text(LocalizedStringKey(options[0].capital))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[0].capital))
                                    .modifier(BasicButton())
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
                                Text(LocalizedStringKey(options[1].capital))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(options[1].capital))
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                }
                            }) {
                                if self.didTap1 {
                                    Text(LocalizedStringKey(options[1].capital))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[1].capital))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap1 ? true : false)
                        }else{
                            if self.didTap1 {
                                Text(LocalizedStringKey(options[1].capital))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[1].capital))
                                    .modifier(BasicButton())
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
                                Text(LocalizedStringKey(options[2].capital))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(options[2].capital))
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                }
                            }) {
                                if self.didTap2 {
                                    Text(LocalizedStringKey(options[2].capital))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[2].capital))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap2 ? true : false)
                        }else{
                            if self.didTap2 {
                                Text(LocalizedStringKey(options[2].capital))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[2].capital))
                                    .modifier(BasicButton())
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
                                Text(LocalizedStringKey(options[3].capital))
                                    .modifier(CorrectButton())
                                
                            }else{
                                Text(LocalizedStringKey(options[3].capital))
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + self.settings.nextDelay) {
                                }
                            }) {
                                if self.didTap3 {
                                    Text(LocalizedStringKey(options[3].capital))
                                        .modifier(WrongButton())
                                }else{
                                    Text(LocalizedStringKey(options[3].capital))
                                        .modifier(BasicButton())
                                }
                            }
                            .disabled(self.didTap3 ? true : false)
                        }else{
                            if self.didTap3 {
                                Text(LocalizedStringKey(options[3].capital))
                                    .modifier(WrongButton())
                            }else{
                                Text(LocalizedStringKey(options[3].capital))
                                    .modifier(BasicButton())
                            }
                        }
                    }
                }
                Spacer()
            }
            VStack{
                ProgressBar(value: $timer).padding(10)
                Spacer()
            }
        }
        .navigationBarTitle("CityToState", displayMode: .inline)
        .onAppear() {
            self.playAgain()
        }
        .alert(isPresented: $finish) {
            Alert(title: Text("Game over!"), message: Text("score <\(self.score)>"),
                  primaryButton: .destructive(Text("Back")) {
                    self.settings.saveScore(score: Int64(self.score), view: "CityToName")
                    self.presentationMode.wrappedValue.dismiss()},
                  secondaryButton: .default(Text("SaveAndPlay")) {
                    self.settings.saveScore(score: Int64(self.score), view: "CityToName")
                    self.playAgain()
                })
        }
    }
}

struct capitalToNameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CityToNameView().environmentObject(UserSettings())
                .environment(\.locale, Locale(identifier: "cs"))
        }
    }
}
