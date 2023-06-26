//  French.swift
//  LanguageLearningMadeDifficult
//
//  Created by Zack Paulson on 6/21/23.
//

import SwiftUI

struct FrenchView: View {
    let quizManager = QuizManager()
    
    var body: some View {
        NavigationView {
            WordListView(quizManager: quizManager)
        }
    }
    
    struct Word {
        let frenchWord: String
        let pronunciation: String
        let englishTranslation: String
        let question: String
        let answer: String
    }
    
    struct WordListView: View {
        let quizManager: QuizManager
        let words: [Word] = [
            Word(frenchWord: "Pomme", pronunciation: "pɔm", englishTranslation: "Apple", question: "What is a round, red or green fruit?", answer: "Apple"),
            Word(frenchWord: "Chat", pronunciation: "ʃa", englishTranslation: "Cat", question: "What is a small, furry animal often kept as a pet?", answer: "Cat"),
            Word(frenchWord: "Maison", pronunciation: "mɛ.zɔ̃", englishTranslation: "House", question: "What is a building where people live?", answer: "House"),
            Word(frenchWord: "Soleil", pronunciation: "sɔ.lɛj", englishTranslation: "Sun", question: "What is the star at the center of our solar system?", answer: "Sun"),
            Word(frenchWord: "Arbre", pronunciation: "aʁbʁ", englishTranslation: "Tree", question: "What is a tall plant with a trunk and branches?", answer: "Tree")
        ]
        
        @State private var isQuizStarted = false
        
        var body: some View {
            VStack {
                if isQuizStarted {
                    QuizView(quizManager: quizManager, words: words)
                } else {
                    List(words, id: \.frenchWord) { word in
                        VStack(alignment: .leading) {
                            Text("French Word: \(word.frenchWord)")
                                .font(.title)
                            Text("Pronunciation: \(word.pronunciation)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("English Translation: \(word.englishTranslation)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .navigationBarTitle("French Words")
                    .padding()
                    Button("Start Quiz") {
                        isQuizStarted = true
                    }
                    .font(.headline)
                    .padding()
                }
            }
        }
    }
    
    struct QuizView: View {
        let quizManager: QuizManager
        let words: [Word]
        
        @State private var currentWordIndex = 0
        @State private var userAnswer = ""
        @State private var isAnswerCorrect = false
        @State private var isQuizFinished = false
        
        var currentWord: Word {
            words[currentWordIndex]
        }
        
        var body: some View {
            VStack {
                if isQuizFinished {
                    Text("Quiz Finished")
                        .font(.title)
                        .padding()
                } else {
                    VStack(alignment: .leading) {
                        Text("Question \(currentWordIndex + 1)")
                            .font(.title)
                            .padding()
                        Text(currentWord.question)
                            .font(.headline)
                            .padding()
                        TextField("Enter your answer", text: $userAnswer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Submit Answer") {
                            checkAnswer()
                        }
                        .padding()
                        .disabled(userAnswer.isEmpty)
                        Text(isAnswerCorrect ? "Correct Answer!" : "Wrong Answer!")
                            .font(.headline)
                            .foregroundColor(isAnswerCorrect ? .green : .red)
                            .padding()
                            .opacity(isAnswerCorrect ? 1.0 : 0.0)
                            .onAppear {
                                withAnimation {
                                    isAnswerCorrect = false
                                }
                            }
                        Button("Next Question") {
                            goToNextQuestion()
                        }
                        .padding()
                        .disabled(!isQuizFinished || currentWordIndex == words.count - 1)
                    }
                    .navigationBarTitle("French Words Quiz")
                    .padding()
                }
            }
        }
        
        func checkAnswer() {
            let trimmedAnswer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
            isAnswerCorrect = trimmedAnswer.lowercased() == currentWord.answer.lowercased()
            if !isAnswerCorrect {
                userAnswer = ""
            }
        }
        
        func goToNextQuestion() {
            if currentWordIndex < words.count - 1 {
                currentWordIndex += 1
                userAnswer = ""
                isAnswerCorrect = false
            } else {
                isQuizFinished = true
            }
        }
    }
}

struct FrenchView_Previews: PreviewProvider {
    static var previews: some View {
        FrenchView()
    }
}
