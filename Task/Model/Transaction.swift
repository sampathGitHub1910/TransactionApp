//
//  Transaction.swift
//  Task
//
//  Created by RPS on 13/06/24.
//

import Foundation

enum TransactionCategory: String, CaseIterable, Identifiable {
    case income = "Income"
    case expense = "Expense"
    
    var id: String { self.rawValue }
}

struct Transaction: Identifiable {
    var id = UUID()
    var title: String
    var amount: Double
    var date: Date
    var category: TransactionCategory
}
