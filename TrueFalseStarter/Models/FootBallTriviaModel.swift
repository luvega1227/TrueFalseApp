//
//  FootBallTriviaModel.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct FootBallTriviaModel {
    var question: String
    var choices: [Int: String]
    var answer: Int
}

var footballQuestions: [FootBallTriviaModel] = [
    FootBallTriviaModel(question: "This team features a lightning bolt on its helmet",
                choices: [1: "New England Patriots",
                          2: "Los Angeles Chargers",
                          3: "Baltimore Ravens"],
                answer: 2),
    FootBallTriviaModel(question: "Which one of the following is not a position in football?",
                choices: [1: "Doubleback",
                          2: "Quarterback",
                          3: "Halfback"],
                answer: 1),
    FootBallTriviaModel(question: "This is the place on the field that you must step into to score a touchdown.",
                choices: [1: "the TD zone",
                          2: "the goal",
                          3: "the end zone"],
                answer: 3),
    FootBallTriviaModel(question: "Their color scheme is purple and gold.",
                choices: [1: "Green Bay Packers",
                          2: "Baltimore Ravens",
                          3: "Minnesota Vikings"],
                answer: 3),
    FootBallTriviaModel(question: "Which one of these numbers would be LEAST likely to be worn by a runningback in the NFL?",
                choices: [1: "43",
                          2: "21",
                          3: "12"],
                answer: 3),
    FootBallTriviaModel(question: "Which one of these is NOT a defensive position?",
                choices: [1:"Safety",
                          2: "Center",
                          3: "Linebacker"],
                answer: 2)
]


// Generates question and assigns it to a number to be indexed

var footballQuestionsToIndex = [Int]()

var footballIndexOfQuestions: Int = 0

func footballGenerateQuestionsToIndex() {
    var numberOfQuestions: Int = 0
    
    while numberOfQuestions < footballQuestions.count {
        footballQuestionsToIndex.append(numberOfQuestions)
        numberOfQuestions += 1
    }
}

// Selects a question to index and removes it temporarily from the index
func footballSelectNextQuestions() {
    footballIndexOfQuestions = footballQuestionsToIndex.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: footballQuestionsToIndex.count))
}


