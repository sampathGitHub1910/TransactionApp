//
//  DashboardView.swift
//  Task
//
//  Created by RPS on 13/06/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @ObservedObject var preferences: UserPreferences
    
    var body: some View {
        VStack{
            Text("Current Balance")
                .font(.system(size: preferences.fontSize.size))
                .padding(.top)
            Text("$\(viewModel.currentBalance, specifier: "%.2f")")
                .font(.system(size: preferences.fontSize.size * 1.5))
                .foregroundColor(viewModel.currentBalance >= 0 ? .green : .red)
                .padding(.bottom)
            Text("Spending Trends")
                .font(.system(size: preferences.fontSize.size))
                .padding(.top)
            SpendingTrendsChart(spendingTrends: viewModel.spendingTrends)
                .frame(height: 200)
                .padding()
            Spacer()
        }
        .padding()
        .navigationBarTitle("Dashboard", displayMode: .inline)
    }
}

struct SpendingTrendsChart: View {
    var spendingTrends: [Double]
    
    var body: some View{
        GeometryReader { geometry in
            let maxSpending = spendingTrends.max() ?? 1
            let heightRatio = geometry.size.height / CGFloat(maxSpending)
            
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(spendingTrends.indices, id: \.self){ index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: CGFloat(spendingTrends[index]) * heightRatio)
                        .animation(.easeInOut(duration: 0.5), value: spendingTrends[index])
                }
            }
        }
    }
}


