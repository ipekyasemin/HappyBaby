//
//  FeedingTrackingView.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import SwiftUI

struct FeedingTrackingView: View {
    @StateObject private var viewModel = FeedingTrackingViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Form {
                    Section(header: Text("Yeni Beslenme Girişi")) {
                        DatePicker("Tarih & Saat", selection: $viewModel.time, displayedComponents: [.date, .hourAndMinute])
                        
                        Picker("Beslenme Tipi", selection: $viewModel.type) {
                            ForEach(FeedingType.allCases) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        TextField("Açıklama (örn: 100 ml)", text: $viewModel.note)
                            .textInputAutocapitalization(.sentences)
                        
                        Button("Kaydet") {
                            viewModel.addEntry()
                        }
                        .disabled(viewModel.note.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                    
                    Section(header: Text("Beslenme Geçmişi")) {
                        if viewModel.entries.isEmpty {
                            Text("Henüz kayıt yok.")
                                .foregroundColor(.gray)
                        } else {
                            List(viewModel.entries.reversed()) { entry in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(formattedDate(entry.time))
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Text(entry.type.rawValue)
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                    
                                    Text(entry.note)
                                        .font(.body)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Beslenme Takibi")
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct FeedingTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        FeedingTrackingView()
    }
}
