//
//  OneRepMaxChartView.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/20/23.
//

import Foundation
import SwiftUI

/// If there is no data then shows `loadingView` otherwise it will show chart view.
struct OneRepMaxChartView: View {
    let dataPoints: [(Date, Double)]
    
    var body: some View {
        GroupBox("One rep max - Chart") {
            if dataPoints.isEmpty {
                LoadingView()
            } else {
                ChartView(dataPoints: dataPoints)
            }
        }
    }
}
