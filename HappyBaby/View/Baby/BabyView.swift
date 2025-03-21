//
//  BabyView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import SwiftUI

struct BabyView: View {
    @StateObject private var viewModel = BabyTrackingViewModel() // ViewModel'i izleyen state
    
    var body: some View {
        NavigationView { // Navigasyon başlığı için kullanılan yapı
            ScrollView { // İçeriğin kaydırılmasını sağlar
                GeometryReader { geometry in // Ekran boyutlarına erişim sağlar
                    let columns = geometry.size.width > 600 ? 2 : 1 // Ekran genişliğine göre sütun sayısını belirler
                    
                    LazyVStack(alignment: .leading, spacing: 20) { // Dikey yığın halinde öğeleri düzenler
                        ForEach(viewModel.categories) { category in // Her kategori için bir bölüm oluştur
                            VStack(alignment: .leading) {
                                Text(category.title) // Kategori başlığı
                                    .font(.headline)
                                    .foregroundColor(.orange)
                                    .padding(.leading)
                                
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns), spacing: 20) { // Dinamik ızgara düzeni
                                    ForEach(category.items) { item in // Kategorideki öğeleri döngüye alır
                                        NavigationLink(destination: item.destination) { // Tıklanınca ilgili sayfaya gider
                                            VStack {
                                                Image(item.imageName) // Resmi gösterir
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3) // Dinamik boyutlandırma
                                                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Köşeleri yuvarlar
                                                Text(item.title) // Öğenin başlığını gösterir
                                                    .font(.body)
                                                    .multilineTextAlignment(.center)
                                                    .frame(width: geometry.size.width * 0.3) // Başlığın genişliğini sınırlandırır
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal) // Yatay boşluk ekler
                            }
                        }
                    }
                    .padding() // Dikey boşluk ekler
                }
            }
            .navigationTitle("Bebek Takibi") // Sayfanın üst başlığını belirler
        }
    }
}


struct BabyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyView() // Önizlemede sayfayı gösterir
    }
}

