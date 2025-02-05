//
//  ContentView.swift
//  BudgetTrackerApp
//
//  Created by admin on 27/01/25.
//

import SwiftUI

struct ContentView: View {

        @State private var username:String=""
    
        @State private var password:String=""
    
        @State private var isLoggedIn=false
    
        @State private var errorMessage=""
        
    
        var body: some View {
            
            VStack {
                if  isLoggedIn
                {
                    Text("Welcome,\(username)!)")
                        .font(.largeTitle)
                        .padding()
                }else{
                    TextField("username",text: $username)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .padding(.bottom)
                    SecureField("password", text: $password)
                    
                    
                    if !errorMessage.isEmpty{
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.bottom)
                    }
                
                Button("Login"){
                    login()
                }
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        
            .padding()
    }
    
    private func login(){
        if username=="Krishna" && password=="Krishna@123" {
            isLoggedIn=true
            
        }else{
            errorMessage="invalid"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
