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
                answer: 2),
    FootBallTriviaModel(question: "Which of these positions is one that doesn't get the ball passed to them??",
                choices: [1:"tight end",
                            2: "running back",
                            3: "corner back"],
                answer: 3),
    FootBallTriviaModel(question: "Which one of these words means to knock a person down in football?",
                choices: [1: "Punt",
                            2: "Interception",
                            3: "Tackle"],
                answer: 3),
    FootBallTriviaModel(question: "This team shares a logo with the University of Georgia",
                choices: [1:"Washington Redskins",
                            2: "Arizona Cardinals",
                            3: "Green Bay Packers"],
                answer: 3
    ),
    FootBallTriviaModel(question: "This team got their name from a poem!",
                choices: [1:"Chicago Bears",
                            2: "Detroit Lions",
                            3: "Baltimore Ravens"],
                answer: 3),
    FootBallTriviaModel(question: "This team's logo is the head of a bird",
                choices: [1:"Philadelphia Eagles",
                            2: "New York Giants",
                            3: "Miami Dolphins"],
                answer: 1)
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

var footballLastRandomQuestion = -1

func footballSelectNextQuestions() -> Any {
    footballIndexOfQuestions = footballQuestionsToIndex.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: footballQuestionsToIndex.count))
    
    if footballIndexOfQuestions == footballLastRandomQuestion {
        return footballSelectNextQuestions()
    } else {
        footballLastRandomQuestion = footballIndexOfQuestions
        return footballQuestions[footballIndexOfQuestions]
    }
}



