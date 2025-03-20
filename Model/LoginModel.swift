//
//  LoginModel.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import Foundation

struct LoginModel: Codable { //Codable: JSON verisini model nesnelerine (deserialization) veya model nesnelerini JSON'a
                             // (serialization) dönüştürmek için kullanılır
    var email: String
    var password: String
    
}

