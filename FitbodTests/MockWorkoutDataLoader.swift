//
//  MockWorkoutDataLoader.swift
//  FitbodTests
//
//  Created by Amit Rajoriya on 3/21/23.
//

import Foundation
@testable import Fitbod

/// Helper class for generating mock data loader
final class MockWorkoutDataLoader: WorkoutLoaderProtocol {
    func loadWorkouts(fileName: String) -> [Workout] {
        return [
            Workout(date: Date(), exercise: "Squats", set: 3, reps: 5, weight: 250),
            Workout(date: Date(), exercise: "Bench Press", set: 3, reps: 5, weight: 150)
        ]
    }
}
