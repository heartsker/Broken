//
//  LevelManager.swift
//  Broken
//
//  Created by Кристина on 06.04.2022.
//

import Foundation

class LevelManager {
    private var levels: [Int: Level]
    init () {
        levels = [:]
    }
    func add (level: Level) {
        if levels[level.number] == nil {
            levels[level.number] = level

        }
    }
    subscript (index: Int) -> Level? {
        levels[index]
    }
}
