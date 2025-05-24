//
//  Exercise.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation

struct Exercise: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let minAgeInMonths: Int
    let maxAgeInMonths: Int
}
