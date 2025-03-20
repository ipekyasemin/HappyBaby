//
//  LoginViewModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import Foundation

class LoginViewModel: ObservableObject { //ObservableObject, SwiftUI'de veri modelinin görsel bileşenlere (view'lara) bağlanmasını sağlayan bir protokoldür. SwiftUI'deki veri akışını yönetmek ve kullanıcı arayüzünü bu verilerle senkronize etmek için kullanılır. Özellikle bir model sınıfının view tarafından gözlemlenmesini (observed) sağlamak için kullanılır.
    
    @Published var email: String = "" //@Published, SwiftUI ve Combine framework'ünde kullanılan bir özelliktir ve veri değişikliklerini izlemeye yarar. Bu özellik, bir değişkenin değerinin değiştiğinde, bu değişikliği gözlemleyen tüm view'ları otomatik olarak bilgilendirir ve UI'yi yeniden render eder.
    
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?

    private var loginModel = LoginModel(email: "", password: "")

    func login() {
        // Burada login işlemi yapılır.
        loginModel.email = email
        loginModel.password = password
        
        
        self.isLoggedIn = true
    }
}
