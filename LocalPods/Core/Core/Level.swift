//
//  Level.swift
//  Broken
//
//  Created by Кристина on 04.04.2022.
//

import Foundation
// swiftlint:disable missing_docs
public class Level {
    public private(set) var number: Int
    var name: String
    var story: String?
    var difficulty: Double
    var start: Int
    var finish: Int
    var bestScore: Int
    var buttons: ButtonsSet

    public init(number: Int, name: String = "", story: String? = nil, difficulty: Double,
                start: Int, finish: Int, bestScore: Int, buttons: ButtonsSet) {
        self.number = number
        self.name = name
        self.story = story
        self.difficulty = difficulty
        self.start = start
        self.finish = finish
        self.bestScore = bestScore
        self.buttons = ButtonsSet()
    }
}

extension Level: CustomStringConvertible {
    public var description: String {
        var str = "Level - \(number)\nName - \(name)\n"
        if story != nil {
            str += "Story: \(story ?? "")\n"
        }
        str += "You started from \(start), and the goal is \(finish)!"
        return str
    }
}
