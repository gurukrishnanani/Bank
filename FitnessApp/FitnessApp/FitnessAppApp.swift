//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by admin on 04/02/25.
//

import SwiftUI

@main
struct FitnessAppApp: App {
    let  persistanceController = PersistanceController.shared
    var body: some Scene {
        WindowGroup {
            FitnessListView()
                .environment(\.managedObjectContext,persistanceController.container.viewContext)
        }
    }
}
