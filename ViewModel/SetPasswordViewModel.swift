//
//  SetPasswordViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//
import Foundation

class SetPasswordViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isPasswordSet: Bool = false
    @Published var errorMessage: String?

    private var setPasswordModel = SetPasswordModel(verificationCode: "")

    func setPassword() {
        // Burada şifre sıfırlama işlemi yapılır.
        setPasswordModel.verificationCode = "dummyCode" // Bu kısımdaki verificationCode gerçek veriden alınmalıdır
        

        self.isPasswordSet = true
    }
}
