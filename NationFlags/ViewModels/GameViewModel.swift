//
//  GameViewModel.swift
//  NationFlags
//
//  Created by Martin Václavík on 04.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    init(withTimer: Bool) {
        useTimer = withTimer
    }
    
    var useTimer: Bool
    @Published var options:[Nation] = []
    @Published var correctOption:Nation? = nil
    
    @Published var timer:Timer? = nil
    
    @Published var time = 60
    var score = 0
    
    @Published var history = Set<Nation?>()
    var pool:[Nation]{
        return Nation.list.filter{GlobalSettings.shared.regions.contains($0.region)}
    }
    
    @Published var disabledButtons : Set<Nation> = []
    @Published var pressedButtons : Set<Nation> = []
    @Published private(set) var showCorrectOption = false
    
    //MARK: - Intents
    
    func startGame() {
        score = 0
        history.removeAll()
        generateOptions()
        if useTimer {
            TimerManager.shared.startTimer()
        }
    }
    func playAgain() {
        TimerManager.shared.resetTimer()
        startGame()
    }
    
    func generateOptions() {
        pressedButtons.removeAll()
        disabledButtons.removeAll()
        showCorrectOption = false
        if history.count < pool.count {
            repeat{
                self.correctOption = pool.randomElement()!
            } while history.contains(self.correctOption)
            
            var options = Set<Nation>()
            guard let correctOption = self.correctOption else { return }
            options.insert(correctOption)
            history.insert(correctOption)
            while options.count < 4 {
                if let incorrectOption = pool.randomElement(){
                    options.insert(incorrectOption)
                }
            }
            self.options = options.map({$0}).shuffled()
        }else{
            GlobalSettings.shared.finish = true
        }
    }
    func highlightCorrectOption() {
        showCorrectOption = true
    }
    func endGame() {
        GlobalSettings.shared.finish = true
    }
    func generateOptions(useDelay: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + GlobalSettings.shared.nextDelay) {
            self.generateOptions()
        }
    }
    
    /// Adjusts current score by set amout.
    /// - Parameters:
    ///   - wasCorrect: indicates if the user tapped the correct option
    ///   - deduct: indicates that the user should be penalized for wrong answer
    func adjustScore(wasCorrect: Bool, deduct: Bool = false) {
        let penalty = deduct ? -5 : 0
        score += wasCorrect ? 10 : penalty
    }
    func adjustScoreWhileLearning(wasCorrect: Bool) {
        score += wasCorrect ? 1 : 0
    }
    func pressedButtonFor(item: Nation) {
        pressedButtons.insert(item)
    }
    func disableAllButtons() {
        disabledButtons.formUnion(options)
    }
    func disableButton(item: Nation) {
        disabledButtons.insert(item)
    }
}
