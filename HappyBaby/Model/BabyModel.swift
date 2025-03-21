//
//  BabyModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import Foundation
import SwiftUICore

// Bebek takip öğelerini temsil eden veri modeli
struct BabyItem: Identifiable {
    let id = UUID() // Her öğeye benzersiz bir kimlik atar
    let title: String // Öğenin başlığı
    let imageName: String // Görsel ismi (Assets içinde tanımlı olmalı)
    let destination: AnyView // Hangi sayfaya yönlendireceğini belirtir
}

// Kategorileri temsil eden model
struct BabyCategory: Identifiable {
    let id = UUID() // Her kategoriye benzersiz bir kimlik atar
    let title: String // Kategori başlığı
    let items: [BabyItem] // İçindeki öğeler listesi
}
