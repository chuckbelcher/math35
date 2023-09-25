//
//  ContentView.swift
//  math35
//
//  Created by Chuck Belcher on 9/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var level = "easy"
    @State private var ttable = 2
    @State private var numQuestions = 5
    @State private var easyNumbers = [1,2,5,10]
    @State private var confidentNumbers = [3,4,9,11]
    @State private var hardNumbers = [6,7,8,9,12]
    
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
            .padding(.bottom)
            
            //Add picker for easy, medium, hard
            VStack (alignment: .leading) {
                Section ("Skill Level") {
                    Picker("Level", selection: $level) {
                        Text("Easy").tag("easy")
                        Text("Confident").tag("confident")
                        Text("Hard").tag("hard")
                    }
                    .pickerStyle(.segmented)
                }
            }
            .bold()
            .padding(.bottom)
            
            //Add picker | stepper for base table, and number of questions
            //Show stepper for number of questions
            VStack (alignment: .leading) {
                Section ("Table to Practice") {
                    Stepper(value: $ttable, in: 2...12, step: 1) {
                        Text("Times Table for: \(ttable)")
                            .foregroundColor(.blue)
                            .padding(.leading)
                    }
                    Stepper(value: $numQuestions, in: 5...15, step: 5) {
                        Text("Number of Questions: \(numQuestions)")
                            .foregroundColor(.blue)
                            .padding(.leading)
                    }
                }
            }
            .bold()
            Spacer()
            
            //Show Questions
            
            
            //Add Text for Result
            
            //Show Score
            
            //Add Reset / play again button.
            Button {
                print("Playing level \(level) for table \(ttable)")
            } label: {
                Text("Play Again")
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color(.blue))
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(30)
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
