//
//  SetPasswordViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//
import Foundation

class SetNewPasswordViewModel: ObservableObject {
    @Published var newPassword = ""  // Kullanıcının girdiği yeni şifre
    @Published var confirmPassword = ""  // Kullanıcının girdiği şifre onayı
    @Published var errorMessage: String?  // Hata mesajları
    @Published var isPasswordSet: Bool = false  // Şifre başarıyla set edildi mi?
    
    // Şifrenin geçerliliğini kontrol etme
    func isValidPassword() -> Bool {
        // Şifre boş olamaz
        guard !newPassword.isEmpty else {
            errorMessage = "Yeni şifre boş olamaz."
            return false
        }
        
        // Şifre onayı boş olamaz
        guard !confirmPassword.isEmpty else {
            errorMessage = "Şifre onayı boş olamaz."
            return false
        }
        
        // Şifrelerin uyuşup uyuşmadığını kontrol et
        guard newPassword == confirmPassword else {
            errorMessage = "Şifreler uyuşmuyor."
            return false
        }
        
        // Şifrenin uzunluğunu kontrol et (örneğin 6 haneli ve güvenli olmalı)
        guard newPassword.count >= 6 else {
            errorMessage = "Şifre en az 6 karakter olmalıdır."
            return false
        }
        
        // Şifreyi geçerli olarak kabul et
        errorMessage = nil
        return true
    }
    
    // Şifreyi güncelleme işlemi
    func setPassword() {
        guard isValidPassword() else { return }
        
        // API çağrısı burada simüle ediliyor
        print("Yeni şifre set edildi: \(newPassword)")
        isPasswordSet = true
    }
}

