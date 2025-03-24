//
//  ForgotPasswordViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""  // Kullanıcının girdiği e-posta
    @Published var errorMessage: String?  // Hata mesajları
    @Published var isEmailSent: Bool = false  // Şifre sıfırlama e-postasının gönderilip gönderilmediğini kontrol eder
    
    func sendPasswordResetEmail() {
        // E-posta geçerliliğini kontrol et
        guard isValidEmail() else { return }
        
        // Burada API çağrısını simüle edebiliriz
        print("Şifre sıfırlama e-postası gönderildi: \(email)")
        isEmailSent = true  // E-posta gönderildiğini belirt
    }
    
    func isValidEmail() -> Bool {
        // E-posta boş olamaz
        guard !email.isEmpty else {
            errorMessage = "Email alanı boş olamaz."
            return false
        }
        
        // E-posta formatını kontrol et
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "^.+@.+\\..+$")
        if !emailPredicate.evaluate(with: email) {
            errorMessage = "Geçerli bir email adresi girin."
            return false
        }
        
        errorMessage = nil
        return true
    }
}

