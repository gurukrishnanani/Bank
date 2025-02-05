//
//  AddTaskView.swift
//  TaskManagerApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI
struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var dueDate = Date()
    @State private var priority: String = "Medium"
    let priorities = ["High", "Medium", "Low"]

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Task Title", text: $title)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Picker("Priority", selection: $priority) {
                    ForEach(priorities, id: \.self) { priority in
                        Text(priority)
                    }
                }
            }

            Button("Save Task") {
                addTask()
            }
        }
        .navigationTitle("Add Task")
    }

    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            
            newTask.title = title
            newTask.dueDate = dueDate
            newTask.priority = priority
            newTask.isCompleted = false

            do {
                try viewContext.save()
                dismiss()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
