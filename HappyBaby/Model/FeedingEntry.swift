//
//  FeedingEntry.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation

enum FeedingType: String, CaseIterable, Identifiable, Codable {
    case breastMilk = "Anne Sütü"
    case formula = "Mama"
    case solidFood = "Katı Gıda"

    var id: String { self.rawValue }
}

struct FeedingEntry: Identifiable, Codable {
    var id = UUID()
    let time: Date
    let type: FeedingType
    let note: String
}

