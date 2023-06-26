//
//  QuizManager.swift
//  LanguageLearningMadeDifficult
//
//  Created by Zack Paulson on 6/25/23.
//

import Foundation

struct Word {
    let question: String
    let answer: String
}

class QuizManager {
    private var quizzes: [Quiz] = []
    private var currentQuizIndex = 0
    
    init() {
        // Add quizzes for each page here
        quizzes.append(Quiz(words: [
            Word(question: "Word 1 question", answer: "Word 1 answer"),
            Word(question: "Word 2 question", answer: "Word 2 answer"),
            Word(question: "Word 3 question", answer: "Word 3 answer"),
            Word(question: "Word 4 question", answer: "Word 4 answer"),
            Word(question: "Word 5 question", answer: "Word 5 answer")
        ]))
        
        quizzes.append(Quiz(words: [
            // Words for the second page quiz
        ]))
        
        quizzes.append(Quiz(words: [
            // Words for the third page quiz
        ]))
    }
    
    func getCurrentQuiz() -> Quiz? {
        if currentQuizIndex < quizzes.count {
            return quizzes[currentQuizIndex]
        }
        return nil
    }
    
    func startNextQuiz() {
        currentQuizIndex += 1
    }
}

class Quiz {
    let words: [Word]
    var currentIndex = 0
    
    init(words: [Word]) {
        self.words = words
    }
    
    func getCurrentQuestion() -> String {
        if currentIndex < words.count {
            return words[currentIndex].question
        }
        return ""
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        if currentIndex < words.count {
            let correctAnswer = words[currentIndex].answer
            return answer.lowercased() == correctAnswer.lowercased()
        }
        return false
    }
    
    func goToNextQuestion() {
        currentIndex += 1
    }
    
    func isQuizFinished() -> Bool {
        return currentIndex >= words.count
    }
}
