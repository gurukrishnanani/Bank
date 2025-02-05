//
//  LoginView.swift
//  BudgetTrackerApp2
//
//  Created by admin on 30/01/25.
//
import SwiftUI
import CoreData

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var username = ""
    @State private var password = ""
    @State private var showAlert = false
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Login") {
                loginUser()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("login Error"), message: Text("Please check your username and password."), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("login Succes"),message: Text("Login Successfully completed."),dismissButton: .default(Text("OK")))
            }
            NavigationLink("Register", destination: RegisterView())
                .padding()
        }
        .padding()
        .navigationTitle("Login")
    }
    
    private func loginUser() {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            // Successful login, proceed to the dashboard or next screen
            // Navigate to the next view (e.g., DashboardView)
        } else {
            showAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
