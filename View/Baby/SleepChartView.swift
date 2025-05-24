//
//  SleepChartView.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import SwiftUI
import Charts

struct SleepChartView: View {
    let entries: [SleepEntry]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Günlük Uyku Süresi")
                .font(.headline)
                .padding(.leading)
            
            Chart {
                ForEach(entriesByDay(), id: \.date) { entry in
                    BarMark(
                        x: .value("Tarih", entry.date, unit: .day),
                        y: .value("Saat", entry.totalDuration / 3600)
                    )
                    .foregroundStyle(.blue)
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.day().month(.abbreviated), centered: true)
                }
            }
            .frame(height: 250)
            .padding(.horizontal)
        }
    }
    
    private func entriesByDay() -> [DailySleepSummary] {
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: entries) {
            calendar.startOfDay(for: $0.start)
        }
        
        return grouped.map { date, entries in
            let total = entries.reduce(0) { $0 + $1.duration }
            return DailySleepSummary(date: date, totalDuration: total)
        }
        .sorted { $0.date < $1.date }
    }
}

struct DailySleepSummary {
    let date: Date
    let totalDuration: TimeInterval
}

#Preview {
    SleepChartView(entries: [SleepEntry](repeating: .init(id: UUID(), start: Date(), end: Date()), count: 10))
}
