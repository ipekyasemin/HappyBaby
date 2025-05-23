//
//  ForgotPasswordViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var errorMessage: String?
    @Published var isEmailSent: Bool = false
    
    func sendPasswordResetEmail() {
        guard isValidEmail() else { return }
        
        print("Şifre sıfırlama e-postası gönderildi: \(email)")
        isEmailSent = true
    }
    
    func isValidEmail() -> Bool {
     
        guard !email.isEmpty else {
            errorMessage = "Email alanı boş olamaz."
            return false
        }
        
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "^.+@.+\\..+$")
        if !emailPredicate.evaluate(with: email) {
            errorMessage = "Geçerli bir email adresi girin."
            return false
        }
        
        errorMessage = nil
        return true
    }
}

