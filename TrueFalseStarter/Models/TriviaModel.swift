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
    TriviaModel(question: "Atlanta is the fourth home of the NBA's Hawks. Which of the following is NOT one of their previous locations?",
                choices: [1: "E. Moline, Illinois",
                          2: "Chicago, Illinois",
                          3: "Milwaukee, Wisconsin",
                          4: "St. Louis, Missouri"],
                answer: 2),
    TriviaModel(question: "The team currently known as the Los Angeles Clippers was originally known as the:",
                choices: [1: "Buffalo Braves",
                          2: "San Diego Conquistadors",
                          3: "Oakland Clippers",
                          4: "Baltimore Bullets"],
                answer: 1),
    TriviaModel(question: "Which one of these is not a 1st overall draft pick?",
                choices: [1: "Chris Webber",
                          2: "Allen Iverson",
                          3: "Dikembe Mutombo",
                          4: "Kenyon Martin"],
                answer: 3),
    TriviaModel(question: "The team known as the Sacramento Kings previously resided in all of the following cities EXCEPT:",
                choices: [1: "Rochester, NY",
                          2: "Cincinnati, OH",
                          3: "Oakland, CA",
                          4: "Kansas City, MO"],
                answer: 3),
    TriviaModel(question: " At the beginning of the twenty-first century, which of these arenas was the oldest still in use?",
                choices: [1: "The BMO Harris Bradley Center",
                          2: "The Palace Of Auburn Hills",
                          3: "The Target Center",
                          4: "The Oracle Arena"],
                answer: 4),
    TriviaModel(question: "The club currently known as the Houston Rockets originated in....",
                choices: [1: "Toledo, OH",
                          2: "San Diego, CA",
                          3: "Huntsville, AL",
                          4: "They have always been in Houston"],
                answer: 2),
    TriviaModel(question: "Which of the following players is the son of Jimmy Walker?",
                choices: [1: "Samaki Walker",
                          2: "Antoine Walker",
                          3: "Tony Dumas",
                          4: "Jalen Rose"],
                answer: 4),
    TriviaModel(question: "Which team was the first to win back to back NBA titles?",
                choices: [1: "Lakers",
                          2: "Celtics",
                          3: "Rockets",
                          4: "Bulls"],
                answer: 1),
    TriviaModel(question: "Which of these played with Tim Duncan?",
                choices: [1: "Jerry Stackhouse",
                          2: "Ken Johnson",
                          3: "Jeff Foster",
                          4: "Loren Woods"],
                answer: 4),
    TriviaModel(question: "The Washington Wizards has previously been known as all of the following EXCEPT:",
                choices: [1: "Chicago Packers",
                          2: "Chicago Zephyrs",
                          3: "Baltimore Bullets",
                          4: "Washington Senators"],
                answer: 4)
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

var lastRandomQuestion = -1

func selectNextQuestions() -> Any {
    indexOfQuestions = questionsToIndex.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: questionsToIndex.count))
    
    if indexOfQuestions == lastRandomQuestion {
        return selectNextQuestions()
    } else {
        lastRandomQuestion = indexOfQuestions
        return questions[indexOfQuestions]
    }
}




