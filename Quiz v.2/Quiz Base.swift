//
//  Quiz Base.swift
//  Quiz v.2
//
//  Created by Denis Aganin on 24.02.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import Foundation


class QuizBase {

let quizArray = ["What is the biggest planet in our solar system?",
                    "What is the chemical symbol for the element oxygen?",
                    "Another name for a tidal wave is a?",
                    "The name of the highest mountain on earth is?",
                    "How many bones do sharks have in their bodies?",
                    "Which metal is heavier, silver or gold?",
                    "Which is the country with the most people?",
                    "Which state is the biggest in the US?",
                    "Which country has the largest area of land?",
                    "Which indoor sport is the most popular in the US?",
                    "What is the rhino's horn made of?",
                    "Which is the country where reggae music originated?",
                    "In which country was golf first played?",
                    "What is the name of the Apple's new language?"]

let answerArray = ["Jupiter",
                    "O",
                    "Tsunami",
                    "Everest",
                    "0",
                    "Gold",
                    "China",
                    "Alaska",
                    "Russia",
                    "Basketball",
                    "Hair",
                    "Jamaica",
                    "Scotland",
                    "Swift"]

    
    var x = 0
    
    func addOne() -> String{
        
        if x < quizArray.count {
            
            x += 1
        }
        
        if x >= quizArray.count {
            
            x = 0
        }
        return randomArr[x].question as String
    }
    
    var randomArr: [QuizElement] = []
    
    init() {
        
        for i in 0...(quizArray.count-1) {
            
            var quizElement = QuizElement(question: quizArray[i], answer: answerArray[i])
            
            randomArr.append(quizElement)
        }
        
        randomArr.shuffle()
    }
    
}


