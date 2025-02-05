//
//  Transaction.swift
//  BudgetTrackerApp2
//
//  Created by admin on 30/01/25.
//

import Foundation
import CoreData
struct Transaction: Identifiable {
    let id = UUID()
    var title: String
    var amount: Double
    var type: TransactionType

    // Enum for transaction type
    enum TransactionType: String, CaseIterable, Identifiable {
        case income = "Income"
        case expense = "Expense"

        var id: String { rawValue } // Each case is identifiable by its raw value
    }
}
