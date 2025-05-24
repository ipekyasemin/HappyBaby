//
//  ExerciseViewModel.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation
import SwiftUI

class ExerciseViewModel: ObservableObject {
    @Published var babyAgeInMonths: Int = 6 // Varsayılan yaş
    @Published var allExercises: [Exercise] = []
    
    init() {
        loadExercises()
    }
    
    var filteredExercises: [Exercise] {
        allExercises.filter {
            $0.minAgeInMonths <= babyAgeInMonths && babyAgeInMonths <= $0.maxAgeInMonths
        }
    }
    
    private func loadExercises() {
        allExercises = [
            Exercise(title: "Karnına Yatırma (Tummy Time)",
                     description: "Bebeğin karın üstü yatması boyun ve sırt kaslarını geliştirir.",
                     minAgeInMonths: 0, maxAgeInMonths: 6),
            
            Exercise(title: "Oyuncak Takibi",
                     description: "Göz ve el koordinasyonu için oyuncakları sağdan sola hareket ettirin.",
                     minAgeInMonths: 2, maxAgeInMonths: 6),
            
            Exercise(title: "Yuvarlanma Egzersizi",
                     description: "Bebeği yan çevirerek yuvarlanma hareketini teşvik edin.",
                     minAgeInMonths: 4, maxAgeInMonths: 8),
            
            Exercise(title: "Oturma Destekli Oyun",
                     description: "Destekle oturtarak oyun oynamasına izin verin.",
                     minAgeInMonths: 6, maxAgeInMonths: 10),
            
            Exercise(title: "Saklambaç Oyunu",
                     description: "Yüzünüzü ellerinizle kapatıp açarak sosyal tepkileri geliştirin.",
                     minAgeInMonths: 6, maxAgeInMonths: 12),
            
            Exercise(title: "Ayakta Durma ve Yürüme Teşviki",
                     description: "Ellerinden tutarak ayağa kaldırmaya çalışın.",
                     minAgeInMonths: 9, maxAgeInMonths: 18)
        ]
    }
}
