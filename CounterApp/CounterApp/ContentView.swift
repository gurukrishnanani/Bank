//
//  ContentView.swift
//  CounterApp
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 30){
            Text("Click Counter")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Count:\(count)")
                .font(.title)
            Button(action: {
                count += 1 //increment
                
            }){
                Text("Tap Me ")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                count = 0
            }){
              Text("Reset")
                    .font(.title2)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.red)
                    .cornerRadius(10)
            }

        }
        
        .padding()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
