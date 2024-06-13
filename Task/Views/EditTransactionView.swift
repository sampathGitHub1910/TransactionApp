//
//  EditTransactionView.swift
//  Task
//
//  Created by RPS on 13/06/24.
//


import SwiftUI

struct EditTransactionView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TransactionViewModel
    @State private var transaction: Transaction

    init(viewModel: TransactionViewModel, transaction: Transaction) {
        _viewModel = ObservedObject(initialValue: viewModel)
        _transaction = State(initialValue: transaction)
    }

    var body: some View {
        Form {
            TextField("Title", text: $transaction.title)
            TextField("Amount", value: $transaction.amount, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
            Picker("Category", selection: $transaction.category) {
                ForEach(TransactionCategory.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            Button("Save") {
                viewModel.updateTransaction(transaction)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle("Edit Transaction")
    }
}

struct EditTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        EditTransactionView(viewModel: TransactionViewModel(), transaction: sampleTransactions[0])
    }
}
