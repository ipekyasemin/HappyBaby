//
//  ReminderViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import Foundation
import SwiftUI

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    
    @Published var reminderTitle: String = ""
    @Published var reminderDate: Date = Date()
    @Published var selectedCategory: ReminderCategory = .general
    @Published var selectedPriority: ReminderPriority = .medium
    
    @Published var editingReminder: Reminder? = nil
    @Published var selectedCategoryFilter: ReminderCategory? = nil
    
    var filteredReminders: [Reminder] {
        if let filter = selectedCategoryFilter {
            return reminders.filter { $0.category == filter }
        } else {
            return reminders
        }
    }
    
    func addOrUpdateReminder() {
        let trimmedTitle = reminderTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }

        if let editing = editingReminder {
            if let index = reminders.firstIndex(where: { $0.id == editing.id }) {
                NotificationManager.shared.cancelNotification(for: reminders[index])
                reminders[index].title = trimmedTitle
                reminders[index].date = reminderDate
                reminders[index].category = selectedCategory
                reminders[index].priority = selectedPriority
                NotificationManager.shared.scheduleNotification(for: reminders[index])
            }
            editingReminder = nil
        } else {
            let newReminder = Reminder(
                title: trimmedTitle,
                date: reminderDate,
                category: selectedCategory,
                priority: selectedPriority
            )
            reminders.append(newReminder)
            NotificationManager.shared.scheduleNotification(for: newReminder)
        }

        resetInputs()
    }

    func editReminder(_ reminder: Reminder) {
        editingReminder = reminder
        reminderTitle = reminder.title
        reminderDate = reminder.date
        selectedCategory = reminder.category
        selectedPriority = reminder.priority
    }

    func deleteReminder(_ reminder: Reminder) {
        NotificationManager.shared.cancelNotification(for: reminder)
        reminders.removeAll { $0.id == reminder.id }
    }

    func resetInputs() {
        reminderTitle = ""
        reminderDate = Date()
        selectedCategory = .general
        selectedPriority = .medium
        editingReminder = nil
    }
}
