//
//  MathQuiz.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class MathQuiz: Quiz {
    
    var questionsArray = [Question]()
    
    init(numberOfQuestions: Int) {
        
        for _ in 0..<numberOfQuestions {
            let question = MathQuestion()
            questionsArray.append(question)
        }
        
    }
}

