//
//  ContentView.swift
//  RestApiApp
//
//  Created by admin on 03/02/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var apiService = APIService()
    
    var body: some View {
        NavigationView {
            List(apiService.posts) { post in
                VStack{
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Rectangle().fill(Color.blue).frame(height: 20)
                    }
                    Spacer().frame(height:50).background(Color.green)
                }
            }
            .navigationTitle("show All Posts")
            
            .onAppear {
                apiService.fetchPosts()
            }
        }
    }
}

