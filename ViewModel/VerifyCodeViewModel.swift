//
//  VerifyCodeViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//

import Foundation

class VerifyCodeViewModel: ObservableObject {
    @Published var verificationCode = ""  // Kullanıcının girdiği doğrulama kodu
    @Published var errorMessage: String?  // Hata mesajları
    @Published var isCodeVerified: Bool = false  // Kod doğrulandı mı kontrol eder
    
    // Doğrulama kodunun geçerli olup olmadığını kontrol etme
    func isValidVerificationCode() -> Bool {
        // Kod boş olamaz
        guard !verificationCode.isEmpty else {
            errorMessage = "Doğrulama kodu boş olamaz."
            return false
        }
        
        // Kodun uzunluğunu kontrol et (örneğin 6 haneli bir kod)
        guard verificationCode.count == 6 else {
            errorMessage = "Doğrulama kodu 6 haneli olmalıdır."
            return false
        }
        
        errorMessage = nil
        return true
    }
    
    // Doğrulama kodu işlemi
    func verifyCode() {
        guard isValidVerificationCode() else { return }
        
        // API çağrısı burada simüle ediliyor
        print("Doğrulama kodu doğru: \(verificationCode)")
        isCodeVerified = true
    }
    
    // Doğrulama kodu gönderme işlemi
    func resendCode() {
        // API çağrısı simüle ediliyor
        print("Doğrulama kodu tekrar gönderildi.")
        verificationCode = ""  // Kod sıfırlanabilir
        errorMessage = nil
    }
}

