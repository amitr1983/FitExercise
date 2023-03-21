//
//  WorkoutListViewModelTests.swift
//  FitbodTests
//
//  Created by Amit Rajoriya on 3/20/23.
//

import XCTest
@testable import Fitbod

/// I have added minimum tests. In the future, we could improve test coverage.
final class WorkoutListViewModelTests: XCTestCase {
    var viewModel: WorkoutListViewModel!
    var mockWorkoutDataLoader: MockWorkoutDataLoader!

    @MainActor override func setUpWithError() throws {
        mockWorkoutDataLoader = MockWorkoutDataLoader()
        viewModel = WorkoutListViewModel(workoutDataLoader: mockWorkoutDataLoader)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testLoadFile() {
        viewModel.loadFile()

        XCTAssertEqual(viewModel.workouts.count, 2)
        XCTAssertEqual(viewModel.workouts[0].exercise, "Squats")
        XCTAssertEqual(viewModel.workouts[0].oneRepMax, 281.25)
        XCTAssertEqual(viewModel.workouts[1].exercise, "Bench Press")
        XCTAssertEqual(viewModel.workouts[1].oneRepMax, 168.75)
    }

    func testCalculateOneRepMaxByExercise() {
        viewModel.workouts = [
            Workout(date: Date(), exercise: "Squats", set: 3, reps: 5, weight: 250),
            Workout(date: Date(), exercise: "Bench Press", set: 3, reps: 5, weight: 150)
        ]
        viewModel.calculateOneRepMaxByExercise()
        
        XCTAssertEqual(viewModel.oneRepMaxByExercise.count, 2)
        XCTAssertEqual(viewModel.oneRepMaxByExercise["Squats"], 281.25)
        XCTAssertEqual(viewModel.oneRepMaxByExercise["Bench Press"], 168.75)
    }
}
