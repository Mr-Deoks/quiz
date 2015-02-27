//
//  QuizElement.swift
//  Quiz v.2
//
//  Created by Denis Aganin on 24.02.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import Foundation

class QuizElement {
    
    var question:String
    var answer:String
    
    init (question:String, answer:String) {
        self.question = question
        self.answer = answer
    }
}

extension Array {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}