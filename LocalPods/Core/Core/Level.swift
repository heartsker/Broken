//
//  Level.swift
//  Broken
//
//  Created by Кристина on 04.04.2022.
//

import Foundation

public class Level {
    public private(set) var number: Int
    var name: String
    var story: String?
    var difficulty: Double
    var start: Int
    var finish: Int
    var best_score: Int
    var buttons: ButtonsSet

    public init(number: Int, name: String = "", story: String? = nil, difficulty: Double, start: Int, finish: Int, best_score: Int, buttons: ButtonsSet) {
        self.number = number
        self.name = name
        self.story = story
        self.difficulty = difficulty
        self.start = start
        self.finish = finish
        self.best_score = best_score
        self.buttons = ButtonsSet()
    }
}

extension Level: CustomStringConvertible {
    public var description: String {
        var str = "Level - \(number)\nName - \(name)\n"
        if story != nil {
            str += "Story: \(story ?? "")\n"
        }
        str += "You started from \(startNumber), and the goal is \(finishNumber)!"
        return str
    }
}
