//
//  AddTransactionView.swift
//  Task
//
//  Created by RPS on 13/06/24.
//

import SwiftUI

struct AddTransactionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TransactionViewModel
    
    @State private var titile: String = ""
    @State private var amount: String = ""
    @State private var category: TransactionCategory = .expense
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Title", text: $titile)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                Picker("Category", selection: $category) {
                    ForEach(TransactionCategory.allCases) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                Button("Add Transaction") {
                    if let amount = Double(amount) {
                        let newData = Transaction(
                            title: titile,
                            amount: amount,
                            date: Date(),
                            category: category
                        )
                        viewModel.addTransaction(newData)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Add Transaction")
        }
        
    }
}
