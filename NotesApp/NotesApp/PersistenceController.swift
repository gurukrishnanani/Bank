//
//  PersistenceController.swift
//  NotesApp
//
//  Created by admin on 31/01/25.
//
import CoreData

struct PersistenceController {
    static let s = PersistenceController()

    let c: NSPersistentContainer

    init(inMemory: Bool = false) {
        c = NSPersistentContainer(name: "NotesApp")

        if inMemory {
            c.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        c.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved Error: \(error), \(error.userInfo)")
            }
        }
    }

    func saveContext() {
        let c1 = c.viewContext
        if c1.hasChanges {
            try? c1.save()
        }
    }
}
