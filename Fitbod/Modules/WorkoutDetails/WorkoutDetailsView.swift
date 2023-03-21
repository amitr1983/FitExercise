//
//  WorkoutDetailsView.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/20/23.
//

import Foundation
import SwiftUI
import Charts

/// This view embed charts view and shows on screen.
struct WorkoutDetailsView: View {
    let exercise: String
    @ObservedObject var viewModel: WorkoutDetailsViewModel
    
    var body: some View {
        VStack {
            OneRepMaxChartView(dataPoints: viewModel.oneRepMaxHistory.sorted(by: { $0.key < $1.key }))
        }
        Spacer()
            .onAppear {
                viewModel.calculateOneRepMaxHistory(exercise: exercise)
            }
            .navigationTitle(exercise)
    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let workouts = [
            Workout(date: DateFormatter().date(from: "2020-10-11 07:00:00 +0000") ?? Date(), exercise: "Back Squat", set: 1, reps: 5, weight: 60),
            Workout(date: DateFormatter().date(from: "2020-10-12 07:00:00 +0000") ?? Date(), exercise: "Back Squat", set: 1, reps: 2, weight: 125)
        ]
        
        let viewModel = WorkoutDetailsViewModel(workouts: workouts)
        WorkoutDetailsView(exercise: "Back Squat", viewModel: viewModel)
    }
}
