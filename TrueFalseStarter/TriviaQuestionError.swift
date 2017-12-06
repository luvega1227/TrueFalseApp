//
//  TriviaQuestionError.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum TriviaQuestionError: String, Error {
    case invalidResource
    case pListConversionError
    case invalidKey
}
