//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

@main
struct NotesApp: App {
    let p = PersistenceController.s

    var body: some Scene {
        WindowGroup {
            NotesListView()
                .environment(\.managedObjectContext, p.c.viewContext)
        }
    }
}
