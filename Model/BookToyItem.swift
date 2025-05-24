//
//  BookToyItem.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation

enum ItemType: String, Codable {
    case book = "Kitap"
    case toy = "Oyuncak"
}

struct BookToyItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    let minAgeInMonths: Int
    let maxAgeInMonths: Int
    let type: ItemType
}

