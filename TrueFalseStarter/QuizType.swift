//
//  QuizType.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum QuizType {
    
    case trivia
    case math
    
    func generateQuiz(_ questions: Int) -> Quiz {
        
        switch self {
            case .trivia: return TriviaQuiz(withNumberOfQuestions: questions)
            case .math: return MathQuiz(numberOfQuestions: questions)
        }
    }
}

