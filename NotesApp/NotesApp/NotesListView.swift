//
//  NotesListView.swift
//  NotesApp
//
//  Created by admin on 31/01/25.

import SwiftUI
import CoreData

struct NotesListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.dateCreated, ascending: false)])
    private var notes: FetchedResults<Note>

    @State private var showAddView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: EditNoteView(note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title ?? "No Title").font(.headline)
                            Text(note.content ?? "No Content").font(.subheadline).foregroundColor(.gray)
                            Text(note.dateCreated ?? Date(), style: .date).font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Show List of Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddView = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddView) {
                AddNoteView()
            }
        }
    }

    private func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            viewContext.delete(note)
        }

        do {
            try viewContext.save()
        } catch {
            print("Error deleting note: \(error)")
        }
    }
}
