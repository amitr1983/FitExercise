//
//  FitbodApp.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/19/23.
//

import SwiftUI

@main
struct FitbodApp: App {
    var body: some Scene {
        let viewModel = WorkoutListViewModel()
        WindowGroup {
            WorkoutListView(viewModel: viewModel)
        }
    }
}
