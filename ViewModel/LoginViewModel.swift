//
//  LoginViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    func login() {
        // Giriş işlemi
        guard isValidCredentials() else { return }
        
        // Bu kısımda API çağrısı simüle ediliyor
        print("Giriş yapıldı: \(email)")
        isLoggedIn = true
    }
    
   
    func isValidCredentials() -> Bool {
            guard !email.isEmpty else {
                errorMessage = "Email alanı boş olamaz."
                return false
            }
            
            guard !password.isEmpty else {
                errorMessage = "Şifre alanı boş olamaz."
                return false
            }
            
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "^.+@.+\\..+$")
            if !emailPredicate.evaluate(with: email) {
                errorMessage = "Geçerli bir email adresi girin."
                return false
            }
            
            if password.count < 6 {
                errorMessage = "Şifre en az 6 karakter olmalıdır."
                return false
            }
            
            errorMessage = nil
            return true
        }
    }


