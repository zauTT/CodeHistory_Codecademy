//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Giorgi Zautashvili on 15.12.24.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}

