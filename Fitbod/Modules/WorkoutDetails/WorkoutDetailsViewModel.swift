//
//  WorkoutDetailsViewModel.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/20/23.
//

import Foundation

/// View model for workout details. Here, I'm filtering workout data by an exercise then adding `workout date` and `one rep max` into a dictionery. The data in this dictionery would be used for plotting a graph.
final class WorkoutDetailsViewModel: ObservableObject {
    let workouts: [Workout]
    @Published var oneRepMaxHistory: [Date: Double] = [:]
    
    init(workouts: [Workout]) {
        self.workouts = workouts
    }
    
    func calculateOneRepMaxHistory(exercise: String) {
        let filteredWorkouts = workouts.filter { $0.exercise == exercise }
        
        _ = filteredWorkouts.map { workout in
            oneRepMaxHistory[workout.date] = Double(workout.oneRepMax)
        }
    }
}
