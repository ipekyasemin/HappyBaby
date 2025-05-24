//
//  ReminderView.swift
//  HappyBaby
//
//  Created by yasemin ipek on 5.03.2025.
//

import SwiftUI

struct ReminderView: View {
    @StateObject private var viewModel = ReminderViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text(viewModel.editingReminder == nil ? "Yeni Hatırlatma" : "Hatırlatmayı Düzenle")) {
                        TextField("Hatırlatma başlığı", text: $viewModel.reminderTitle)
                            .textInputAutocapitalization(.sentences)

                        DatePicker("Tarih & Saat", selection: $viewModel.reminderDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])

                        Picker("Kategori", selection: $viewModel.selectedCategory) {
                            ForEach(ReminderCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }

                        Picker("Öncelik", selection: $viewModel.selectedPriority) {
                            ForEach(ReminderPriority.allCases) { priority in
                                Text(priority.rawValue).tag(priority)
                            }
                        }

                        Button(viewModel.editingReminder == nil ? "Kaydet" : "Güncelle") {
                            viewModel.addOrUpdateReminder()
                        }
                        .disabled(viewModel.reminderTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }

                    Section(header: Text("Filtre")) {
                        Picker("Kategoriye göre filtrele", selection: $viewModel.selectedCategoryFilter) {
                            Text("Tümü").tag(ReminderCategory?.none)
                            ForEach(ReminderCategory.allCases) { category in
                                Text(category.rawValue).tag(ReminderCategory?.some(category))
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    Section(header: Text("Hatırlatmalar")) {
                        if viewModel.filteredReminders.isEmpty {
                            Text("Filtreye uyan hatırlatma yok.")
                                .foregroundColor(.gray)
                        } else {
                            List {
                                ForEach(viewModel.filteredReminders.sorted(by: { $0.date < $1.date })) { reminder in
                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack {
                                            Text(reminder.title)
                                                .font(.headline)
                                            Spacer()
                                            Text(reminder.priority.rawValue)
                                                .font(.caption)
                                                .foregroundColor(color(for: reminder.priority))
                                                .padding(4)
                                                .background(Color.gray.opacity(0.15))
                                                .clipShape(Capsule())
                                        }

                                        Text(formattedDate(reminder.date))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)

                                        Text("Kategori: \(reminder.category.rawValue)")
                                            .font(.footnote)
                                            .foregroundColor(.blue)
                                    }
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive) {
                                            viewModel.deleteReminder(reminder)
                                        } label: {
                                            Label("Sil", systemImage: "trash")
                                        }

                                        Button {
                                            viewModel.editReminder(reminder)
                                        } label: {
                                            Label("Düzenle", systemImage: "pencil")
                                        }
                                        .tint(.orange)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Hatırlatıcı")
            .onAppear {
                NotificationManager.shared.requestPermission()
            }
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    private func color(for priority: ReminderPriority) -> Color {
        switch priority {
        case .low: return .green
        case .medium: return .orange
        case .high: return .red
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}

