//
//  TimeManager.swift
//  NationFlags
//
//  Created by Martin Václavík on 04.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

final class TimerManager: ObservableObject {
    static var shared = TimerManager()
    
    @Published var time = 60
    private var timer: Timer?
    
    func startTimer() {
        GlobalSettings.shared.finish = false
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timer = timer
            withAnimation(.linear(duration: 1)) {
                self.time -= 1
            }
            
            if self.time <= 0 {
                self.timer?.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + GlobalSettings.shared.nextDelay) {
                    GlobalSettings.shared.finish = true
                }
            }
        }
    }
    
    func resetTimer() {
        time = 60
        self.timer?.invalidate()
    }
}
