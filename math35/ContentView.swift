//
//  ContentView.swift
//  math35
//
//  Created by Chuck Belcher on 9/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Math")
                Image(systemName: "plus")
                Text("35")
            }
            .font(.title)
            .foregroundColor(.mint)
            .bold()
            Spacer()
            
            //Add picker for easy, medium, hard
            
            //Add picker | stepper for base table, and number of questions
            
            //Add Text for Result
            
            //Show Score
            
            //Add Reset / play again button.
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
