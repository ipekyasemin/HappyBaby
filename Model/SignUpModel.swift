//
//  SignUpModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//
import Foundation

struct SignUpModel: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var confirmPassword: String
}

