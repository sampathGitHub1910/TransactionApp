//
//  ContentView.swift
//  Task
//
//  Created by RPS on 13/06/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TransactionViewModel()
    @StateObject private var preferences = UserPreferences()
    @State private var showingAddTransaction = false
    @State private var showingPreferences = false
    @State private var selectedTransaction: Transaction?
    @State private var showingEditTransaction = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DashboardView(viewModel: viewModel, preferences: preferences)) {
                    Text("View Dashboard")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach(viewModel.transactions) { transaction in
                        TransactionsView(transaction: transaction)
                            .onTapGesture {
                                selectedTransaction = transaction
                                showingEditTransaction = true
                            }
                    }
                    .onDelete(perform: viewModel.deleteTransaction)
                }
                .navigationBarTitle("Transactions")
                .navigationBarItems(
                    leading: Button(action: {
                        showingPreferences = true
                    }) {
                        Image(systemName: "gearshape")
                    },
                    trailing: Button(action: {
                        showingAddTransaction = true
                    }) {
                        Image(systemName: "plus")
                    }
                )
                .sheet(isPresented: $showingAddTransaction) {
                    AddTransactionView(viewModel: viewModel)
                }
                .sheet(isPresented: $showingPreferences) {
                    PreferencesView(preferences: preferences)
                }
                .sheet(item: $selectedTransaction) { transaction in
                    EditTransactionView(viewModel: viewModel, transaction: transaction)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
