//
//  QuestionType.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol Question {
    var question: String { get }
    var answer: Any { get }
    var choice01: String { get }
    var choice02: String { get }
    var choice03: String { get }
    var choice04: String { get }
    var choicesArray: [String] { get }
}
