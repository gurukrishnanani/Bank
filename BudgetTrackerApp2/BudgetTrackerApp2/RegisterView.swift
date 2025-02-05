//
//  RegisterView.swift
//  BudgetTrackerApp2
//
//  Created by admin on 30/01/25.
//

import SwiftUI
import CoreData

struct RegisterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Register") {
                registerUser()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Registration successfull"),  dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        .navigationTitle("Register")
    }

    private func registerUser() {
        guard password == confirmPassword else {
            showAlert = true
            return
        }

        let existingUser = fetchUser(with: username)
        if existingUser == nil {
            let newUser = User(context: viewContext)
            newUser.username = username
            newUser.password = password
            saveContext()
            // Proceed to login or dashboard
        } else {
            showAlert = true
        }
    }
    
    private func fetchUser(with username: String) -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", username)
        do {
            let result = try viewContext.fetch(request)
            return result.first
        } catch {
            return nil
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
