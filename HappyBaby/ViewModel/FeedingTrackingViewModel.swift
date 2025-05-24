//
//  FeedingTrackingViewModel.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation
import SwiftUI

class FeedingTrackingViewModel: ObservableObject {
    @Published var entries: [FeedingEntry] = []
    @Published var time: Date = Date()
    @Published var type: FeedingType = .breastMilk
    @Published var note: String = ""

    func addEntry() {
        let entry = FeedingEntry(time: time, type: type, note: note)
        entries.append(entry)
        resetInputs()
    }

    private func resetInputs() {
        time = Date()
        type = .breastMilk
        note = ""
    }
}

