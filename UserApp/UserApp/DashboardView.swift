//
//  DashboardView.swift
//  UserApp
//
//  Created by admin on 29/01/25.
//

import SwiftUI



struct DashboardView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Dashboard!")
                .font(.largeTitle)
                .padding()

            Button("Logout") {
                logout()
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }

    private func logout() {
        // Handle logout logic if needed
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
