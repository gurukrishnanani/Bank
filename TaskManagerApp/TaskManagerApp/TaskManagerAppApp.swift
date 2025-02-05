//
//  TaskManagerAppApp.swift
//  TaskManagerApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

@main
struct TaskManagerAppApp: App {
    let  persistentController = PersistentController.shared
    var body: some Scene {
           WindowGroup {
               TaskListView()
                   .environment(\.managedObjectContext, persistentController.container.viewContext)
           }
       }
   }
