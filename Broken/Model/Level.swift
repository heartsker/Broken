//
//  Level.swift
//  Broken
//
//  Created by Кристина on 04.04.2022.
//

import Foundation

class Level {
    var number: Int
    var name: String
    var story: String?
    var startNumber: Int
    var finishNumber: Int
    var buttons: ButtonsSet
    var difficulty: Int
    var bestPossibleScore: Int
    var bestScore: Int?
    var stars: Int? {
        nil
    }

    init(number: Int, name: String, story: String?, startNumber: Int, finishNumber: Int, difficulty: Int, bestPossibleScore: Int) {
        self.number = number
        self.name = name
        self.story = story
        self.startNumber = startNumber
        self.finishNumber = finishNumber
        self.buttons = ButtonsSet()
        self.difficulty = difficulty
        self.bestPossibleScore = bestPossibleScore

        bestScore = nil
    }
}

extension Level: CustomStringConvertible {
    var description: String {
        var str = "Level - \(number)\nName - \(name)\n"
        if story != nil {
            str += "Story: \(story!)\n"
        }
        str += "You started from \(startNumber), and the goal is \(finishNumber)!"
        return str
    }
}
