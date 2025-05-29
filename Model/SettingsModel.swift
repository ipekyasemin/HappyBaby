import Foundation

struct SettingsModel: Codable, Identifiable {
    var id = UUID()
    
    // Kullanıcı Bilgileri
    var userName: String
    var email: String
    var password: String
    
    // Bebek Bilgileri
    var babyName: String
    var babyBirthday: String
    var babyHeight: String
    var babyAge: String
    var babyGender: String
    
    // Örnek Veri
    static let example = SettingsModel(
        userName: "Kullanıcı Adı",
        email: "email@example.com",
        password: "********",
        babyName: "Bebek Adı",
        babyBirthday: "01.01.2024",
        babyHeight: "50 cm",
        babyAge: "1",
        babyGender: "Kız"
    )
}

