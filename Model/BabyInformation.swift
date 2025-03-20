//
//  BabyInformation.swift
//  HappyBaby
//
//  Created by yasemin ipek on 19.03.2025.
//

import Foundation


struct BabyInformation: Codable { //Codable: JSON verisini model nesnelerine (deserialization) veya model nesnelerini JSON'a
                             // (serialization) dönüştürmek için kullanılır
    var boy: Int
    var yas: Int
    var cinsiyet: String
    var tarih: Date
    
}
