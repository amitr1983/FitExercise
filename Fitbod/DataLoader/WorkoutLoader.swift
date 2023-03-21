//
//  WorkoutLoader.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/19/23.
//

import Foundation

/// Protocol for file loader. I'm using protocol here for better testability.
protocol WorkoutLoaderProtocol {
    func loadWorkouts(fileName: String) -> [Workout]
}

/// This is a helper for loading workout data file. It will read a file line by line and parse the data as per given model and return list of workout.
struct WorkoutLoader: WorkoutLoaderProtocol {
    func loadWorkouts(fileName: String) -> [Workout] {
        var workouts: [Workout] = []

        /// Generate File path
        if let workoutFileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") {
            do {
                /// Read file data
                let workoutData = try String(contentsOf: workoutFileURL, encoding: .utf8)
                let workoutLines = workoutData.components(separatedBy: .newlines)

                /// Read each line in the file and data seperated by a comma.
                for line in workoutLines {
                    let workoutComponents = line.components(separatedBy: ",")
                    
                    guard workoutComponents.count == 5,
                          let date = DateFormatter.shortDateFormatter.date(from: workoutComponents[0]),
                          let set = Int(workoutComponents[2]),
                          let reps = Int(workoutComponents[3]),
                          let weight = Int(workoutComponents[4]) else {
                        continue
                    }

                    let workout = Workout(date: date, exercise: workoutComponents[1], set: set, reps: reps, weight: weight)
                    workouts.append(workout)
                }
            } catch {
                print("Error loading file data: \(error)")
            }
        } else {
            print("Error: file \(fileName) is not found")
        }
        
        return workouts
    }
}
