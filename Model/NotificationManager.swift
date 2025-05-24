//
//  NotificationManager.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import UserNotifications
import Foundation

class NotificationManager {
    static let shared = NotificationManager()
    
    private init() {}

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Bildirim izni hatası: \(error)")
            }
        }
    }

    func scheduleNotification(for reminder: Reminder) {
        let content = UNMutableNotificationContent()
        content.title = "Hatırlatma"
        content.body = reminder.title
        content.sound = .default

        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let request = UNNotificationRequest(identifier: reminder.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Bildirim planlanamadı: \(error)")
            }
        }
    }

    func cancelNotification(for reminder: Reminder) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [reminder.id.uuidString])
    }
}

