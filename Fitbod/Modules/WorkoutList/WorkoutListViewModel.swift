//
//  WorkoutListViewModel.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/19/23.
//

import Foundation

/// This is a model for list view. Here, Its loading the data and and calculating maximum `one rep max` for each exercise. This will be displayed on the list view for each exercise.
final class WorkoutListViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    @Published var oneRepMaxByExercise: [String: Double] = [:]
    private let workoutDataLoader: WorkoutLoaderProtocol
    
    init(workoutDataLoader: WorkoutLoaderProtocol = WorkoutLoader()) {
        self.workoutDataLoader = workoutDataLoader
    }
    
    func loadFile() {
        workouts = workoutDataLoader.loadWorkouts(fileName: "WorkoutData")
    }
    
    func calculateOneRepMaxByExercise() {
        let groupedWorkouts = Dictionary(grouping: workouts, by: { $0.exercise })
        for (exercise, workouts) in groupedWorkouts {
            let maxOneRepMax = workouts.map { Double($0.oneRepMax) }.max() ?? 0.0
            oneRepMaxByExercise[exercise] = maxOneRepMax
        }
    }
}
