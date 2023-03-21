//
//  Workout.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/19/23.
//

import Foundation

/// Model for `Workout`
struct Workout {
    let id = UUID()
    let date: Date
    let exercise: String
    let set: Int
    let reps: Int
    let weight: Int
    
    var oneRepMax: Double {
        let oneRM = Double(weight) * (36.0 / (37.0 - Double(reps)))
        return oneRM
    }
}
