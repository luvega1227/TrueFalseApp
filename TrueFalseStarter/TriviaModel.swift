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

//var questions: [TriviaModel] = [
//    TriviaModel(question: "What superhero grew up on the planet Tamaran?",
//                    choices: [1: "Ultra Boy",
//                              2: "The Silver Surfer",
//                              3: "Starfire",
//                              4: "Hawkgirl"],
//                    answer: 3),
//    TriviaModel(question: "Edwin Jarvis serves as butler to what superteam?",
//                    choices: [1: "Avengers",
//                              2: "Fantastic Four",
//                              3: "Justice League",
//                              4: "Teen Titans"],
//                    answer: 1),
//    TriviaModel(question: "Who was the first costumed superhero?",
//                    choices: [1: "The Phantom",
//                              2: "Superman",
//                              3: "Arrow",
//                              4: "Crimson Avenger"],
//                    answer: 1),
//    TriviaModel(question: "What year was the first modern comic book printed?",
//                    choices: [1: "1938",
//                              2: "1933",
//                              3: "1925",
//                              4: "1917"],
//                    answer: 2),
//    TriviaModel(question: "Who created the Vision?",
//                    choices: [1: "Ultron",
//                              2: "Hank Pym",
//                              3: "Tony Stark",
//                              4: "Reed Richards"],
//                    answer: 1),
//    TriviaModel(question: "Who is Bruce Banner's cousin?",
//                    choices: [1: "Carol Danvers",
//                              2: "Greer Nelson",
//                              3: "Jessica Drew",
//                              4: "Jennifer Walters"],
//                    answer: 4),
//    TriviaModel(question: "What was first introduced in Detective Comics #29?",
//                   choices: [1: "The Batarang",
//                              2: "Batman's Utility Belt",
//                              3: "Robin",
//                              4: "The Batmobile"],
//                    answer: 2),
//    TriviaModel(question: "What artist penciled the first appearance of Beta Ray Bill?",
//                   choices: [1: "John Byrne",
//                              2: "Bill Sienkiewicz",
//                              3: "Todd McFarlane",
//                              4: "Walt Simonson"],
//                    answer: 4),
//   TriviaModel(question: "In Son of Superman, who is Superman's son?",
//                    choices: [1: "Jim Kent",
//                              2: "Jon Kent",
//                              3: "Jak Kent",
//                              4: "Jud Kent"],
//                    answer: 2),
//    TriviaModel(question: "What superhero was born with the Curse of Kordax?",
//                    choices: [1: "Hawkman",
//                              2: "Aquaman",
//                              3: "Ghost Rider",
//                              4: "Captain Marvel"],
//                    answer: 2),
//    TriviaModel(question: "What superhero gained his powers after being exposed to the Orb of Ra?",
//                    choices: [1: "Metamorpho",
//                              2: "Hawkman",
//                              3: "Suicide Squad",
//                              4: "Iron Fist"],
//                    answer: 1),
//    TriviaModel(question: "Which of the following heroes was NOT a member of the magically powerd Sentinels of Magic?",
//                    choices: [1: "Doctor Strange",
//                              2: "Zatanna",
//                              3: "Doctor Fate",
//                              4: "Raven"],
//                    answer: 1),
//    TriviaModel(question: "Which Green Lantern came first?",
//                    choices: [1: "John Stewart",
//                              2: "Alan Scott",
//                              3: "Hal Jordan",
//                              4: "Guy Gardner"],
//                    answer: 2),
//    TriviaModel(question: "Who is the Scarlet Witch's twin brother?",
//                    choices: [1: "Wonder Man",
//                              2: "Magneto",
//                              3: "Doctor Strange",
//                              4: "Quicksilver"],
//                    answer: 4),
//    TriviaModel(question: "What character teamed up with a different hero in almost every issue of The Brave and the Bold?",
//                    choices: [1: "Superman",
//                              2: "Spider-Man",
//                              3: "Batman",
//                              4: "Captain America"],
//                    answer: 3),
//    TriviaModel(question: "What member of the Inhumans did Johnny Storm date?",
//                    choices: [1: "Medusa",
//                              2: "Luna Maximoff",
//                              3: "Crystal",
//                              4: "Sapphiras"],
//                    answer: 3),
//    TriviaModel(question: "What is the best-selling comic book of all time?",
//                    choices: [1: "Batman #428",
//                              2: "Superman #75",
//                              3: "Amazing Spider-Man #583",
//                              4: "X-Men #1"],
//                    answer: 4),
//    TriviaModel(question: "Who is Plastic Man's sidekick?",
//                    choices: [1: "Dum Dum Dugan",
//                              2: "Gummy Boy",
//                              3: "Bucky Barnes",
//                              4: "Woozy Winks"],
//                    answer: 4),
//    TriviaModel(question: "What color was the Hulk when he was originally introduced?",
//                    choices: [1: "Purple",
//                              2: "Red",
//                              3: "Grey",
//                              4: "Green"],
//                    answer: 3)
//]



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

