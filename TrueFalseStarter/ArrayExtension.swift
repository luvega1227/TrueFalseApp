//
//  ArrayExtension.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

extension Array {
    
    var shuffle:[Element] {
        var elements = self
        for index in 0..<elements.count {
            let newIndex = Int(arc4random_uniform(UInt32(elements.count-index)))+index
            if index != newIndex {
                elements.swapAt(index, newIndex)
            }
        }
        return elements
    }
    func groupOf(n:Int)-> [[Element]] {
        var result:[[Element]]=[]
        for i in 0...(count/n)-1 {
            var tempArray:[Element] = []
            for index in 0...n-1 {
                tempArray.append(self[index+(i*n)])
            }
            result.append(tempArray)
        }
        
        return result
    }
    
    func takeElements(elementCount: Int) -> Array {
        var elementCount = elementCount
        if (elementCount > count) {
            elementCount = count
        }
        return Array(self[0..<elementCount])
    }
}
