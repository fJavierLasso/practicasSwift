//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Javier Lasso on 28/3/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q:String, a:[String], ca:String){
        text = q
        answer = a
        correctAnswer = ca
    }
}
