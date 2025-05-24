//
//  BabyView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import SwiftUI

struct BabyView: View {
    @StateObject private var viewModel = BabyTrackingViewModel()

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    if viewModel.categories.isEmpty {
                        Text("Henüz içerik eklenmedi.")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            ForEach(viewModel.categories) { category in
                                VStack(alignment: .leading) {
                                    Text(category.title)
                                        .font(.headline)
                                        .foregroundColor(.orange)
                                        .padding(.leading)

                                    let columns = geometry.size.width > 600 ? 2 : 1
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns), spacing: 20) {
                                        ForEach(category.items) { item in
                                            NavigationLink(destination: item.destination) {
                                                VStack {
                                                    Image(item.imageName)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(
                                                            width: min(max(geometry.size.width * 0.3, 100), 200),
                                                            height: min(max(geometry.size.width * 0.3, 100), 200)
                                                        )
                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        .accessibilityLabel(Text(item.title))
                                                        .accessibilityHint(Text("Detaylara gitmek için çift dokunun"))

                                                    Text(item.title)
                                                        .font(.body)
                                                        .multilineTextAlignment(.center)
                                                        .frame(width: min(max(geometry.size.width * 0.3, 100), 200))
                                                }
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Bebek Takibi")
            }
        }
    }
}

struct BabyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyView()
    }
}
