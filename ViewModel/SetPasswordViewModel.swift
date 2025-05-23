//
//  SetPasswordViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//
import Foundation

class SetNewPasswordViewModel: ObservableObject {
    @Published var newPassword = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?
    @Published var isPasswordSet: Bool = false
    
    // Şifreyi güncelleme işlemi
    func setPassword() {
        guard isValidPassword() else { return }
        
        // API çağrısı burada simüle ediliyor
        print("Yeni şifre set edildi: \(newPassword)")
        isPasswordSet = true
    }

    
    func isValidPassword() -> Bool {
        // Şifre boş olamaz
        guard !newPassword.isEmpty else {
            errorMessage = "Yeni şifre boş olamaz."
            return false
        }
       
        guard !confirmPassword.isEmpty else {
            errorMessage = "Şifre onayı boş olamaz."
            return false
        }
        
        guard newPassword == confirmPassword else {
            errorMessage = "Şifreler uyuşmuyor."
            return false
        }
        
       
        guard newPassword.count >= 6 else {
            errorMessage = "Şifre en az 6 karakter olmalıdır."
            return false
        }
        
    
        errorMessage = nil
        return true
    }
    
}
