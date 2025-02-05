//
//  BudgetTrackerApp2App.swift
//  BudgetTrackerApp2
//
//  Created by admin on 28/01/25.
//

import SwiftUI

@main
struct BudgetTrackerApp2App: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
        TransactionListView()
               .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
