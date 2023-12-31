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
    @State private var score = 0
    @State private var questionNumber = 1
    @State private var isPlaying = false

    
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
            
            HStack {
                Spacer()
                Text("Score: ")
                Text("\(score)")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .font(.title2)
            .bold()
            
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
                    
                    if isPlaying {
                        
                        Text("Question Number:  \(questionNumber) of \(numQuestions)")
                            .font(.headline)
                           
                        
                        HStack {
                            Text("\(ttable)  X \(currentQuestion) = ")
                                .padding(.leading)
                                .font(.largeTitle)
                            TextField("?", text: $currentAnswer)
                                .frame(width: 80)
                                .font(.largeTitle)
                            Spacer()
                            Button {
                                checkAnswer()
                            } label: {
                                Image(systemName: "checkmark")
                                Text("Check")
                                    .bold()
                                
                            }
                        }
                    } else {
                        VStack {
                            Text("Game Over You scored \(score) out of \(numQuestions)")
                                .padding(.vertical, 50)
                                .foregroundColor(.red)
                            Button {
                                startGame()
                            } label: {
                                Text("Start Game")
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 50)
                                    .background(Color(.blue))
                                    .foregroundColor(.white)
                                    .bold()
                                    .cornerRadius(30)
                                
                            }
                        }
                    }
                }
                .font(.title2)
                Spacer()
                
            }
            .bold()
            .padding(.top, 20)
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
    
    func startGame() {
        score = 0
        questionNumber = 1
        getNumber()
        isPlaying = true
    }
    
    func checkAnswer() {
        //check answer
        if Int(currentAnswer) == ttable * currentQuestion {
            print("You answered \(currentAnswer) which is correct")
            score += 1
        } else {
            print("Better luck next time")
        }
        
        if questionNumber < numQuestions {
            questionNumber += 1
            currentAnswer = ""
            getNumber()
        } else {
            currentAnswer = ""
            isPlaying = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
