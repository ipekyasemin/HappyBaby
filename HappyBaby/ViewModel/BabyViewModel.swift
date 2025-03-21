//
//  BabyViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import Foundation
import SwiftUICore

class BabyTrackingViewModel: ObservableObject {
    @Published var categories: [BabyCategory] = [ // Değişiklikleri takip eder
        BabyCategory(title: "BEBEK TAKİBİ", items: [
            BabyItem(title: "Uyku Takibi", imageName: "sleep_icon", destination: AnyView(SleepTrackingView())),
            BabyItem(title: "Beslenme Takibi", imageName: "feeding_icon", destination: AnyView(FeedingTrackingView()))
        ]),
        BabyCategory(title: "ÖNERİLER", items: [
            BabyItem(title: "Oyun Ve Egzersiz", imageName: "exercise_icon", destination: AnyView(ExerciseView())),
            BabyItem(title: "Kitap Ve Oyuncaklar", imageName: "books_toys_icon", destination: AnyView(BooksToysView()))
        ])
    ]
}
