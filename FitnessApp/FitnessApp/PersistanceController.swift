//
//  PersistanceController.swift
//  FitnessApp
//
//  Created by admin on 04/02/25.
//

import Foundation
import CoreData

struct PersistanceController{
    static let Shared = PersistanceController()
    
    let Container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        
        Container = NSPersistentContainer(name:"FitnessApp")
        
        if inMemory{
            Container.persistentStoreDescriptions.first?.url =URL(fileURLWithPath:"/dev/null")
        }
        Container.loadPersistentStore{
            _error in
            if let error = error as NSError?{
                fatalError("Unresolved Error)")
                
            }
        }
    }
    func saveContext(){
        let context = container.viewContext
        if context.hasChanges{
            try? context.save()
        }
    }
}
