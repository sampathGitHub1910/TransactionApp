//
//  TransactionsView.swift
//  Task
//
//  Created by RPS on 13/06/24.
//

import SwiftUI

struct TransactionsView: View {
    var transaction: Transaction
    
    var body: some View {
        HStack{
            VStack{
                Text(transaction.title)
                    .font(.headline)
                Text("\(transaction.date, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("$\(transaction.amount, specifier: "%.2f")")
                .font(.headline)
        }
        .padding()
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
} ()
