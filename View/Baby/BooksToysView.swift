//
//  BooksToysView.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import SwiftUI

struct BooksToysView: View {
    @StateObject private var viewModel = BooksToysViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Bebek Yaşı")) {
                        Stepper(value: $viewModel.babyAgeInMonths, in: 0...36) {
                            Text("\(viewModel.babyAgeInMonths) ay")
                        }
                    }
                    
                    if !viewModel.recommendedBooks.isEmpty {
                        Section(header: Text("Önerilen Kitaplar")) {
                            ForEach(viewModel.recommendedBooks) { item in
                                bookOrToyRow(item)
                            }
                        }
                    }
                    
                    if !viewModel.recommendedToys.isEmpty {
                        Section(header: Text("Önerilen Oyuncaklar")) {
                            ForEach(viewModel.recommendedToys) { item in
                                bookOrToyRow(item)
                            }
                        }
                    }
                    
                    if viewModel.recommendedBooks.isEmpty && viewModel.recommendedToys.isEmpty {
                        Section {
                            Text("Bu yaş aralığı için önerilen kitap veya oyuncak bulunamadı.")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Kitaplar & Oyuncaklar")
        }
    }
    
    private func bookOrToyRow(_ item: BookToyItem) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.title)
                .font(.headline)
                .foregroundColor(item.type == .book ? .purple : .green)
            Text(item.description)
                .font(.body)
        }
        .padding(.vertical, 4)
    }
}

struct BooksToysView_Previews: PreviewProvider {
    static var previews: some View {
        BooksToysView()
    }
}
