//
//  TaskListView.swift
//  TaskManagerApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI
//import CoreData
struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.dueDate, ascending: true)],
        animation: .default
    ) private var tasks: FetchedResults<Task>

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title ?? "Untitled")
                                .font(.headline)
                            Text("Due: \(task.dueDate ?? Date(), formatter: dateFormatter)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Text(task.priority ?? "Medium")
                            .padding(8)
                            .background(task.priority == "High" ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Show List Of Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
}
