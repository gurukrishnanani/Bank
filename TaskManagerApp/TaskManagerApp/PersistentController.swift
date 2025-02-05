//
//  PersistentController.swift
//  TaskManagerApp
//
//  Created by admin on 01/02/25.
//
import CoreData

class PersistentController {
    static let shared = PersistentController()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "TaskManagerApp")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
