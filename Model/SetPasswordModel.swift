//
//  SetPasswordModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 23.03.2025.
//


import Foundation

struct SetNewPasswordModel {
    var newPassword: String
    var confirmPassword: String
    
    init(newPassword: String = "", confirmPassword: String = "") {
        self.newPassword = newPassword
        self.confirmPassword = confirmPassword
    }
}
