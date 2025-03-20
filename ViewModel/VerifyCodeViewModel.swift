//
//  VerifyCodeViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import Foundation

class VerifyCodeViewModel: ObservableObject {
    @Published var verificationCode: String = ""
    @Published var isVerified: Bool = false
    @Published var errorMessage: String?

    private var verifyCodeModel = VerifyCodeModel(verificationCode: "")

    func verifyCode() {
        // Burada doğrulama işlemi yapılır.
        verifyCodeModel.verificationCode = verificationCode
        
        self.isVerified = true
    }
}

