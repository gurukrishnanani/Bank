//
//  AddTransactionView.swift
//  BudgetTrackerApp2
//
//  Created by admin on 31/01/25.
//

import SwiftUI
import CoreData

struct AddTransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var amount = ""
    @State private var category = "expense"

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Transaction Details")) {
                    TextField("Enter Title", text: $title)
                    TextField("Enter Amount", text: $amount)
                        .keyboardType(.decimalPad)

                    Picker("Category", selection: $category) {
                        Text("Income").tag("income")
                        Text("Expense").tag("expense")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Add New Transaction", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    addTransaction()
                    dismiss()
                }
                .disabled(amount.isEmpty || title.isEmpty || Double(amount) == nil) // Disable save button if amount is invalid
            )
        }
    }

    private func addTransaction() {
        let newTransaction = Transaction(context: viewContext)
        newTransaction.id = UUID()
        newTransaction.title = title
        newTransaction.category = category
        
        if let isDouble = Double(amount) {
            newTransaction.amount = isDouble
        } else {
            newTransaction.amount = 0.0 // Set a default value if the amount is invalid
        }

        do {
            try viewContext.save()
            title = ""
            amount = ""
            category = "expense"
        } catch {
            print("Error saving transaction: \(error)")
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
          //  .environment(\.managedObjectContext, //PersistenceController.preview.container.viewContext)
    }
}
