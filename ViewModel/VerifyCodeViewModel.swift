//
//  VerifyCodeViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//

import Foundation

class VerifyCodeViewModel: ObservableObject {
    
    @Published var verificationCode: String = ""
    @Published var errorMessage: String?
    @Published var isCodeVerified: Bool = false
    
    func isValidVerificationCode() -> Bool {
        // Kod boş mu?
        guard !verificationCode.isEmpty else {
            errorMessage = "Doğrulama kodu boş olamaz."
            return false
        }
        guard verificationCode.count == 6 else {
            errorMessage = "Doğrulama kodu 6 haneli olmalıdır."
            return false
        }
        
        errorMessage = nil
        return true
    }
    
    func verifyCode() {
        // Kodun geçerli olup olmadığını kontrol et
        guard isValidVerificationCode() else { return }
        
        // API işlemini simüle ediyoruz (gerçek API çağrısı buraya eklenebilir)
        print("Doğrulama kodu doğru: \(verificationCode)")
        
        // Kod doğrulandı, durumu güncelle
        isCodeVerified = true
    }
    
    func resendCode() {
        // API işlemini simüle ediyoruz (gerçek bir API çağrısı buraya eklenebilir)
        print("Doğrulama kodu tekrar gönderildi.")
        
        verificationCode = ""
        errorMessage = nil
    }
}
