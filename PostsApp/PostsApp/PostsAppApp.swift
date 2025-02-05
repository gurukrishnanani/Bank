//
//  PostsAppApp.swift
//  PostsApp
//
//  Created by admin on 29/01/25.
//

import SwiftUI

@main
struct PostsAppApp: App {
    let persistentController = PersistenceController.shared
       var body: some Scene {
           WindowGroup {
               PostsView()
                   .environment(\.managedObjectContext, persistentController.container.viewContext)
           }
       }
   }
