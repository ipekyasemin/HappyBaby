//
//  BooksToysViewModel.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import Foundation
import SwiftUI

class BooksToysViewModel: ObservableObject {
    @Published var babyAgeInMonths: Int = 6
    @Published var allItems: [BookToyItem] = []
    
    init() {
        loadItems()
    }
    
    var recommendedBooks: [BookToyItem] {
        allItems.filter { $0.type == .book && $0.minAgeInMonths <= babyAgeInMonths && babyAgeInMonths <= $0.maxAgeInMonths }
    }
    
    var recommendedToys: [BookToyItem] {
        allItems.filter { $0.type == .toy && $0.minAgeInMonths <= babyAgeInMonths && babyAgeInMonths <= $0.maxAgeInMonths }
    }
    
    private func loadItems() {
        allItems = [
            // Kitaplar
            BookToyItem(title: "Siyah Beyaz Kontrast Kartlar", description: "Yenidoğanlar için kontrast görsellerle görsel gelişim.", minAgeInMonths: 0, maxAgeInMonths: 3, type: .book),
            BookToyItem(title: "Yumuşak Kumaş Kitaplar", description: "Hışırtılı sayfalarla dokunsal uyarım.", minAgeInMonths: 3, maxAgeInMonths: 6, type: .book),
            BookToyItem(title: "İlk Sözcükler", description: "Basit nesne isimleri ve resimler içeren kitaplar.", minAgeInMonths: 6, maxAgeInMonths: 12, type: .book),
            BookToyItem(title: "Sesli Hikaye Kitapları", description: "Basınca ses çıkaran interaktif kitaplar.", minAgeInMonths: 12, maxAgeInMonths: 24, type: .book),

            // Oyuncaklar
            BookToyItem(title: "Renkli Çıngırak", description: "Kolay tutulabilen, ses çıkaran çıngırak.", minAgeInMonths: 0, maxAgeInMonths: 4, type: .toy),
            BookToyItem(title: "Diş Kaşıyıcı", description: "Diş çıkaran bebekler için güvenli silikon kaşıyıcı.", minAgeInMonths: 3, maxAgeInMonths: 8, type: .toy),
            BookToyItem(title: "Bloklar", description: "Yumuşak bloklarla motor becerileri geliştirici oyun.", minAgeInMonths: 6, maxAgeInMonths: 18, type: .toy),
            BookToyItem(title: "İtme ve Çekme Oyuncakları", description: "Yürümeye başlayan bebekler için ideal.", minAgeInMonths: 12, maxAgeInMonths: 24, type: .toy)
        ]
    }
}

