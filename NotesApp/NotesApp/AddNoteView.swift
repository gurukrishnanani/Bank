//
//  AddNoteView.swift
//  NotesApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Details")) {
                    TextField("Title", text: $title)
                    TextField("Enter The Content",text: $content)
                        .frame(height: 150)
                }
            }
            .navigationTitle("Add Note")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    saveNote()
                    dismiss()
                }
                .disabled(title.isEmpty || content.isEmpty)
            )
        }
    }

    private func saveNote() {
        let newNote = Note(context: viewContext)
        newNote.id = UUID()
        newNote.title = title
        newNote.content = content
        newNote.dateCreated = Date()

        do {
            try viewContext.save()
        } catch {
            print("Error saving note: \(error)")
        }
    }
}
