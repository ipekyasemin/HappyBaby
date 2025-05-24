//
//  SleepTrackingView.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import SwiftUI

struct SleepTrackingView: View {
    @StateObject private var viewModel = SleepTrackingViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Form {
                    Section(header: Text("Yeni Uyku Girişi")) {
                        DatePicker("Başlangıç", selection: $viewModel.sleepStart, displayedComponents: [.date, .hourAndMinute])
                        DatePicker("Bitiş", selection: $viewModel.sleepEnd, displayedComponents: [.date, .hourAndMinute])
                        
                        Button("Kaydet") {
                            viewModel.addSleepEntry()
                        }
                        .disabled(viewModel.sleepEnd <= viewModel.sleepStart)
                    }
                    
                    Section(header: Text("Uyku Geçmişi")) {
                        if viewModel.sleepEntries.isEmpty {
                            Text("Henüz uyku verisi girilmedi.")
                                .foregroundColor(.gray)
                        } else {
                            List(viewModel.sleepEntries) { entry in
                                VStack(alignment: .leading) {
                                    Text("Başlangıç: \(formattedDate(entry.start))")
                                    Text("Bitiş: \(formattedDate(entry.end))")
                                    Text("Süre: \(formatDuration(entry.duration))")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
                SleepChartView(entries: viewModel.sleepEntries)
            }
            .navigationTitle("Uyku Takibi")
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        return "\(hours) saat \(minutes) dakika"
    }
}

struct SleepTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        SleepTrackingView()
    }
}

