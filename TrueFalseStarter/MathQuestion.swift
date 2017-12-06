//
//  MathQuestion.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit

class MathQuestion: Question {
    
    private let number: Int
    private let otherNumber: Int
    let answer: Any
    let question: String
    
    let choice01: String
    let choice02: String
    let choice03: String
    let choice04: String
    
    internal lazy var choicesArray: [String] = {
        return [self.choice01, self.choice02, self.choice03, self.choice04].shuffle
    }()
    
    
    init() {
        
        number = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        otherNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        answer = number * otherNumber
        question = "\(number) * \(otherNumber)"
        
        choice01 = String(describing: GKRandomSource.sharedRandom().nextInt(upperBound: 100))
        choice02 = String(describing: GKRandomSource.sharedRandom().nextInt(upperBound: 100))
        choice03 = String(describing: GKRandomSource.sharedRandom().nextInt(upperBound: 100))
        choice04 = String(describing: answer)
    }

}

