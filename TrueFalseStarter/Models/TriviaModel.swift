//
//  QuestionProvider.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct TriviaModel {
    var question: String
    var choices: [Int: String]
    var answer: Int
}

var questions: [TriviaModel] = [
    TriviaModel(question: "This was the only US President to serve more than two consecutive terms.",
                choices: [1: "George Washington",
                          2: "Franklin D. Roosevelt",
                          3: "Woodrow Wilson",
                          4: "Andrew Jackson"],
                answer: 2),
    TriviaModel(question: "Which of the following countries has the most residents?",
                choices: [1: "Nigeria",
                          2: "Russia",
                          3: "Iran",
                          4: "Vietnam"],
                answer: 1),
    TriviaModel(question: "In what year was the United Nations founded?",
                choices: [1: "1918",
                          2: "1919",
                          3: "1945",
                          4: "1954"],
                answer: 3),
    TriviaModel(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                choices: [1: "Paris",
                          2: "Washington D.C.",
                          3: "New York City",
                          4: "Boston"],
                answer: 3),
    TriviaModel(question: "Which nation produces the most oil?",
                choices: [1: "Iran",
                          2: "Iraq",
                          3: "Brazil",
                          4: "Canada"],
                answer: 4),
    TriviaModel(question: "Which country has most recently won consecutive World Cups in Soccer?",
                choices: [1:"Italy",
                          2: "Brazil",
                          3: "Argentina",
                          4: "Spain"],
                answer: 2)
]


// Generates question and assigns it to a number to be indexed

var questionsToIndex = [Int]()

var indexOfQuestions: Int = 0

func generateQuestionsToIndex() {
    var numberOfQuestions: Int = 0
    
    while numberOfQuestions < questions.count {
        questionsToIndex.append(numberOfQuestions)
        numberOfQuestions += 1
    }
}

// Selects a question to index and removes it temporarily from the index
func selectNextQuestions() {
    indexOfQuestions = questionsToIndex.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: questionsToIndex.count))
}

