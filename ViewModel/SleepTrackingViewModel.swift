//
//  SleepTrackingViewModel.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation
import SwiftUI

class SleepTrackingViewModel: ObservableObject {
    @Published var sleepEntries: [SleepEntry] = []
    @Published var sleepStart: Date = Date()
    @Published var sleepEnd: Date = Date()
    
    func addSleepEntry() {
        guard sleepEnd > sleepStart else { return }
        let newEntry = SleepEntry(start: sleepStart, end: sleepEnd)
        sleepEntries.append(newEntry)
        resetInputs()
    }
    
    private func resetInputs() {
        sleepStart = Date()
        sleepEnd = Date()
    }
}

