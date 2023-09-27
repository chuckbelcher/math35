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
    @State private var numQuestions = 2
    @State private var easy = [1,2,5,10]
    @State private var confident = [3,4,9,11]
    @State private var hard = [6,7,8,9,12]
    @State private var currentQuestion = 10
    @State private var currentAnswer = ""
    
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
                    Stepper(value: $numQuestions, in: 2...6, step: 2) {
                        Text("Number of Questions: \(numQuestions)")
                            .foregroundColor(.blue)
                            .padding(.leading)
                    }
                }
            }
            .bold()

            
            //Show Questions
            VStack (alignment: .leading) {
                Section ("Play Your Game") {
                    HStack {
                        //TODO: Add if ready to play and start button
                        Button {
                            getNumber()
                        } label: {
                            Text("New Question")
                                .padding(.leading)
                                .font(.headline)
                            
                        }
                        Spacer()
                        Text("\(ttable)  X \(currentQuestion) = ")
                            .font(.title3)
                        
                        TextField("?", text: $currentAnswer)
                            .font(.title2)
                            .frame(width: 40)
                        Button {
                            print(currentAnswer)
                        } label: {
                            Image(systemName: "checkmark")
                                .font(.headline)
                            Text("Check")
                                .bold()
                            
                        }
                    }
                }
                Spacer()

            }
            .bold()
            .padding(.top, 20)
            
            Spacer()
            //TODO: Add Text for Result
            
            //TODO: Show Score
            
            //Add Reset / play again button
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
        .onAppear(perform: getNumber)
            
        
    }
    
    func getNumber() {

        if level == "easy" {
            currentQuestion = easy.randomElement() ?? 0
        } else if level == "confident" {
            currentQuestion = confident.randomElement() ?? 0
        } else {
            currentQuestion = hard.randomElement() ?? 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
