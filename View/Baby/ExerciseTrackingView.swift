//
//  ExerciseTrackingView.swift
//  HappyBaby
//
//  Created by Davud Gunduz on 24.05.2025.
//

import SwiftUI

struct ExerciseTrackingView: View {
    @StateObject private var viewModel = ExerciseViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Bebek Yaşı")) {
                        Stepper(value: $viewModel.babyAgeInMonths, in: 0...36) {
                            Text("\(viewModel.babyAgeInMonths) ay")
                        }
                    }
                    
                    Section(header: Text("Önerilen Egzersizler ve Oyunlar")) {
                        if viewModel.filteredExercises.isEmpty {
                            Text("Bu yaş için önerilen bir egzersiz bulunamadı.")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(viewModel.filteredExercises) { exercise in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(exercise.title)
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                    Text(exercise.description)
                                        .font(.body)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Egzersiz & Oyun")
        }
    }
}

struct ExerciseTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTrackingView()
    }
}
