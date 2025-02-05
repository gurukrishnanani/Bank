//
//  EditTransactionView.swift
//  BudgetTrackerApp2
//
//  Created by admin on 30/01/25.
//
import SwiftUI
import CoreData

struct EditTransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @ObservedObject var transaction: Transaction

    @State private var title:String
    @State private var amount:String
    @State private var category:String

    init(transaction: Transaction) {
        self.transaction = transaction
        _title = State(initialValue: transaction.title ?? "")
        _amount = State(initialValue: String(transaction.amount))
        _category = State(initialValue: transaction.category ?? "expense")
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Details")) {
                    TextField("Enter Title", text: $title)
                    TextField("Enter Amount", text: $amount)
                        .keyboardType(.decimalPad)
// allow to user select option dropdown or segmented control
                    Picker("Category", selection: $category) {
                       Text("Income").tag("income")
                       Text("Expense").tag("expense")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Edit Transaction", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: HStack {
                    Button("Delete") {
                        deleteTransaction()
                        dismiss()
                    }
                    .foregroundColor(.red)

                    Button("Update") {
                        updateTransaction()
                        dismiss()
                    }
                    .disabled(amount.isEmpty || title.isEmpty || Double(amount) == nil)
                }
            )
        }
    }

    private func updateTransaction() {
        // Update the transaction
        transaction.title = title
        transaction.category = category
        
        if let amountDouble = Double(amount) {
            transaction.amount = amountDouble
        } else {
            transaction.amount = 0.0
        }

        do {
            try viewContext.save()  // Save the change
        } catch {
            print("Error updating transaction: \(error)")
        }
    }

    private func deleteTransaction() {
        // Delete Core Data
        viewContext.delete(transaction)

        do {
            try viewContext.save()  // Save the context after deletion
        } catch {
            print("Error deleting transaction: \(error)")
        }
    }
}


