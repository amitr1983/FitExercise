//
//  WorkoutListView.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/19/23.
//

import Foundation
import SwiftUI

/// This view is responsible for showing workout list and maximum one rep max for each exercise.
struct WorkoutListView: View {
    @ObservedObject var viewModel = WorkoutListViewModel()

    var body: some View {
        contentView
            .onAppear {
                viewModel.loadFile()
                viewModel.calculateOneRepMaxByExercise()
            }
    }

    @ViewBuilder
    private var contentView: some View {
        if viewModel.oneRepMaxByExercise.isEmpty {
            emptyStateView
        } else {
            NavigationView {
                listView
                    .navigationTitle("Workout")
            }
        }
    }

    /// Will be displayed when no data returned
    private var emptyStateView: some View {
        VStack {
            Text("No workouts found")
                .foregroundColor(.secondary)
        }
    }

    /// Using List for SwiftUI table. We could use lazyVstack also for more customization but as its a simple tableview so list make sense here.
    private var listView: some View {
        List {
            ForEach(viewModel.oneRepMaxByExercise.sorted(by: { $0.value > $1.value }), id: \.key) { exercise, oneRepMax in
                NavigationLink(destination: workoutDetailsView(exercise: exercise)) {
                    exerciseRowView(exercise: exercise, oneRepMax: oneRepMax)
                }
            }
        }
        .padding([.top], 16)
        .listStyle(.plain)
    }

    /// Content view for each row.
    private func exerciseRowView(exercise: String, oneRepMax: Double) -> some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                Text(exercise)
                Spacer(minLength: 5)
                Text("One Rep Max | lbs")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            Spacer()
            Text(String(format: "%.2f", oneRepMax))
        }
    }

    private func workoutDetailsView(exercise: String) -> WorkoutDetailsView {
        WorkoutDetailsView(exercise: exercise, viewModel: WorkoutDetailsViewModel(workouts: viewModel.workouts))
    }
}
