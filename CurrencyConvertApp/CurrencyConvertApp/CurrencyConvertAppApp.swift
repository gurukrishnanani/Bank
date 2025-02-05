//
//  CurrencyConvertAppApp.swift
//  CurrencyConvertApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

@main
struct CurrencyConvertAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        
        TransactionListView{
            
            TransactionListView(context : persistenceController.container.viewContext)
        }
    }
}
