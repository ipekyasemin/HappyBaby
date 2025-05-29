import SwiftUI

struct BlogView: View {
    @StateObject var viewModel = BlogViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // Kategori Başlıkları
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(["Güncel", "Bakım", "Beslenme", "Yorum"], id: \.self) { category in
                                Text(category)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(Color.red.opacity(0.2))
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Haber Kartları
                    ForEach(viewModel.posts) { post in
                        VStack(alignment: .leading, spacing: 8) {
                            AsyncImage(url: URL(string: post.imageURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(12)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 200)
                                    .cornerRadius(12)
                            }
                            
                            Text(post.category.uppercased())
                                .font(.caption)
                                .foregroundColor(.red)
                            
                            Text(post.title)
                                .font(.headline)
                            
                            Button(action: {
                                viewModel.toggleSave(post: post)
                            }) {
                                HStack {
                                    Image(systemName: post.isSaved ? "bookmark.fill" : "bookmark")
                                    Text(post.isSaved ? "Kaydedildi" : "Kaydet")
                                }
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Mucize Bebek Blog")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    BlogView()
}

