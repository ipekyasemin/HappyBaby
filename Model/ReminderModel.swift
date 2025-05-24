//
//  ReminderModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import Foundation

enum ReminderCategory: String, CaseIterable, Identifiable, Codable {
    case feeding = "Beslenme"
    case sleep = "Uyku"
    case vaccination = "Aşı"
    case general = "Genel"

    var id: String { self.rawValue }
}

enum ReminderPriority: String, CaseIterable, Identifiable, Codable {
    case low = "Düşük"
    case medium = "Orta"
    case high = "Yüksek"

    var id: String { self.rawValue }
}

struct Reminder: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var date: Date
    var category: ReminderCategory
    var priority: ReminderPriority

    init(id: UUID = UUID(), title: String, date: Date, category: ReminderCategory, priority: ReminderPriority) {
        self.id = id
        self.title = title
        self.date = date
        self.category = category
        self.priority = priority
    }
}
