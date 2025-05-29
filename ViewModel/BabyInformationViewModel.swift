//
//  BabyInformationViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//



import Foundation
import SwiftUI

class BabyInformationViewModel: ObservableObject {
    // View ile binding yapılacak @Published özellikler
    @Published var babyHeight: String = ""
    @Published var babyAge: String = ""
    @Published var isBoy: Bool = false
    @Published var isGirl: Bool = false
    @Published var birthDate: Date = Date()
    
    // Kaydedilen model örneği (opsiyonel)
    @Published var savedInformation: BabyInformation?
    
    // Hata mesajı (isteğe bağlı)
    @Published var errorMessage: String?
    
    // Verileri işleyip kaydeden fonksiyon
    func saveInformation() {
        // Doğrulama
        guard let height = Int(babyHeight), height > 0 else {
            errorMessage = "Geçerli bir boy giriniz."
            return
        }
        
        guard let age = Int(babyAge), age >= 0 else {
            errorMessage = "Geçerli bir yaş giriniz."
            return
        }
        
        // Cinsiyet kontrolü
        var gender: String = ""
        if isBoy && !isGirl {
            gender = "Erkek"
        } else if isGirl && !isBoy {
            gender = "Kız"
        } else {
            errorMessage = "Lütfen sadece bir cinsiyet seçiniz."
            return
        }
        
        // Model nesnesi oluştur
        let babyInfo = BabyInformation(boy: height, yas: age, cinsiyet: gender, tarih: birthDate)
        self.savedInformation = babyInfo
        self.errorMessage = nil
        
        // (İsteğe bağlı) buradan bir veritabanına veya API'ye veri gönderilebilir.
    }
}
