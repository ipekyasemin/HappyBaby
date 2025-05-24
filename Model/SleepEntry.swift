//
//  SleepEntry.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation

struct SleepEntry: Identifiable, Codable {
    var id = UUID()
    let start: Date
    let end: Date
    
    var duration: TimeInterval {
        end.timeIntervalSince(start)
    }
}
