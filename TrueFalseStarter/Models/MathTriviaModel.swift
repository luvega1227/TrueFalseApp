//
//  MathTriviaModel.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct MathTriviaModel {
    var question: String
    var choices: [Int: String]
    var answer: Int
}

var mathQuestions: [MathTriviaModel] = [
    MathTriviaModel(question: "10 + 500",
                choices: [1: "3",
                          2: "510",
                          3: "300",
                          4: "20"],
                answer: 2),
    MathTriviaModel(question: "9 * 9",
                choices: [1: "81",
                          2: "72",
                          3: "0",
                          4: "76"],
                answer: 1),
    MathTriviaModel(question: "1001 * 0",
                choices: [1: "1918",
                          2: "1919",
                          3: "0",
                          4: "1954"],
                answer: 3),
    MathTriviaModel(question: "9 - 4",
                choices: [1: "3",
                          2: "6",
                          3: "5",
                          4: "9"],
                answer: 3),
    MathTriviaModel(question: "5 * 9",
                choices: [1: "30",
                          2: "89",
                          3: "22",
                          4: "45"],
                answer: 4),
    MathTriviaModel(question: "3 * 4",
                choices: [1:"14",
                          2: "12",
                          3: "7",
                          4: "8"],
                answer: 2)
]



// Generates question and assigns it to a number to be indexed

var mathQuestionsToIndex = [Int]()

var mathIndexOfQuestions: Int = 0

func mathGenerateQuestionsToIndex() {
    var numberOfQuestions: Int = 0

    while numberOfQuestions < mathQuestions.count {
        mathQuestionsToIndex.append(numberOfQuestions)
        numberOfQuestions += 1
    }
}

// Selects a question to index and removes it temporarily from the index
func mathSelectNextQuestions() {
    mathIndexOfQuestions = mathQuestionsToIndex.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: mathQuestionsToIndex.count))
}







