//
//  TranscationViewModel.swift
//  Task
//
//  Created by RPS on 13/06/24.
//

import Foundation

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = sampleTransactions
    
    var currentBalance: Double {
        transactions.reduce(0) { $0 + ($1.category == .income ? $1.amount : -$1.amount) }
    }
    
    var spendingTrends: [Double] {
        let expenses = transactions.filter { $0.category == .expense}
        let grouppedExpenses = Dictionary(grouping: expenses) { Calendar.current.startOfDay(for: $0.date) }
        let dailySpending = grouppedExpenses.mapValues { $0.reduce(0) { $0 + $1.amount }}
        return dailySpending.sorted(by: { $0.key < $1.key }).map { $0.value }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }

    func updateTransaction(_ transaction: Transaction) {
        if let index = transactions.firstIndex(where: { $0.id == transaction.id }) {
            transactions[index] = transaction
        }
    }
    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}
