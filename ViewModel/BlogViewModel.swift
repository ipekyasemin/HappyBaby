import SwiftUI
import Combine

class BlogViewModel: ObservableObject {
    @Published var posts: [BlogPost] = []
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        // Örnek veri (Bunu Firestore'dan veya API'den çekebilirsin)
        let sampleData = [
            BlogPost(id: "1", title: "Bebeklerde Salya Akıntısı Neden Olur?", category: "Gelişim", imageURL: "https://via.placeholder.com/300"),
            BlogPost(id: "2", title: "Yenidoğan Bebeğin İlk Kakası", category: "Bakım", imageURL: "https://via.placeholder.com/300"),
            BlogPost(id: "3", title: "Bebek Kundaklama", category: "Bakım", imageURL: "https://via.placeholder.com/300"),
            BlogPost(id: "4", title: "Doğumdan Sonra Kanama", category: "Sağlık", imageURL: "https://via.placeholder.com/300")
        ]
        
        self.posts = sampleData
    }
    
    func toggleSave(post: BlogPost) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].isSaved.toggle()
        }
    }
}

