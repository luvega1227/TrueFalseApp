//
//  QuestionsUnarchiver.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class QuestionsUnarchiver {
    
    class func questionsFromArray(array: [[String : String]]) -> [TriviaQuestion] {
        
        var questionsArray = [TriviaQuestion]()
        
        for aQuestion in array {
            
            if let question = aQuestion["question"], let answer = aQuestion["answer"], let choice01 = aQuestion["choice01"], let choice02 = aQuestion["choice02"], let choice03 = aQuestion["choice03"] {
                
                let questionObject = TriviaQuestion(question: question, answer: answer, choice01: choice01, choice02: choice02, choice03: choice03)
                
                questionsArray.append(questionObject)
                
            }
        }
        
        return questionsArray
        
    }
    
}
