//
//  SignUpViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//


import Foundation

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isSignedUp: Bool = false
    @Published var errorMessage: String?

    private var signUpModel = SignUpModel(firstName: "", lastName: "", email: "", password: "", confirmPassword: "")

    func signUp() {
        // Burada signup işlemi yapılır.
        signUpModel.firstName = firstName
        signUpModel.lastName = lastName
        signUpModel.email = email
        signUpModel.password = password
        signUpModel.confirmPassword = confirmPassword
        
        self.isSignedUp = true
    }
}
