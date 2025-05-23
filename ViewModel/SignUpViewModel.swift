//
//  SignUpViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//


import Foundation

class SignUpViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?
    @Published var isSignedUp: Bool = false
    
    func signUp() {
        guard isValidInput() else { return }
        
        print("Kayıt başarılı: \(email)")
        isSignedUp = true
    }
    
    func isValidInput() -> Bool {
        // İsim ve soyisim doğrulama
        guard !firstName.isEmpty else {
            errorMessage = "İsim alanı boş olamaz."
            return false
        }
        
        guard !lastName.isEmpty else {
            errorMessage = "Soyisim alanı boş olamaz."
            return false
        }
        
        // E-posta doğrulama
        guard !email.isEmpty else {
            errorMessage = "Email alanı boş olamaz."
            return false
        }
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "^.+@.+\\..+$")
        if !emailPredicate.evaluate(with: email) {
            errorMessage = "Geçerli bir email adresi girin."
            return false
        }
        
        // Şifre doğrulama
        guard !password.isEmpty else {
            errorMessage = "Şifre alanı boş olamaz."
            return false
        }
        
        if password.count < 6 {
            errorMessage = "Şifre en az 6 karakter olmalıdır."
            return false
        }
        
        if password != confirmPassword {
            errorMessage = "Şifreler uyuşmuyor."
            return false
        }
        
        errorMessage = nil  // Hata mesajı temizlenir
        return true
    }
}

