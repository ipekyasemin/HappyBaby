import Foundation

struct BlogPost: Identifiable, Codable {
    var id: String
    var title: String
    var category: String
    var imageURL: String
    var isSaved: Bool = false
}

