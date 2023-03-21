//
//  ChartView.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/20/23.
//

import Foundation
import SwiftUI
import Charts

/// Plotting a line chart view. Here I'm using SwiftUI `Charts` Here, I'm using `LineMark` chart and plotting the data against x and y axis.
/// TODO: Segregate data y month, quarter and year
/// TODO: Add a horizontal scrollbar. Its very easy and only few lines of code but should be added only after discussing with team.
struct ChartView: View {
    let dataPoints: [(Date, Double)]
    
    var body: some View {
        Chart {
            ForEach(dataPoints.sorted(by: { $0.0 < $1.0 }), id: \.0) { date, oneRepMax in
                LineMark(
                    x: .value("Date", date, unit: .month),
                    y: .value("OneRM", oneRepMax)
                )
                .foregroundStyle(.cyan)
                .symbol(Circle().strokeBorder(lineWidth: 1.5))
            }
        }
        .padding()
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text("Year Range")
                .font(.headline)
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartYScale(
            domain: .automatic(includesZero: false)
        )
        .aspectRatio(16/9, contentMode: .fit)
    }
}
