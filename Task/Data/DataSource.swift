//
//  DataSource.swift
//  Task
//
//  Created by RPS on 13/06/24.
//

import Foundation

let sampleTransactions = [
    Transaction(title: "Groceries", amount: 45.90, date: Date(), category: .expense),
    Transaction(title: "Electicity Bill", amount: 120.0, date: Date().addingTimeInterval(-86400), category: .expense),
    Transaction(title: "Internet Bill", amount: 60.0, date: Date().addingTimeInterval(-172800), category: .expense),
    Transaction(title: "Rent", amount: 950, date: Date().addingTimeInterval(-259200), category: .expense),
    Transaction(title: "Salary", amount: 2000.0, date: Date().addingTimeInterval(-518400), category: .income)]
