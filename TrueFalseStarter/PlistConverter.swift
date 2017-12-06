//
//  PlistConverter.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class PlistConverter {
    
    class func arrayFromFile(resource: String, ofType type: String) throws -> [[String : String]] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            throw TriviaQuestionError.invalidResource
        }
        
        guard let array = NSArray(contentsOfFile: path), let castArray = array as? [[String: String]] else {
            throw TriviaQuestionError.pListConversionError
        }
        
        return castArray
    
    }
    
}
