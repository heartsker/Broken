//
//  LevelManager.swift
//  Broken
//
//  Created by Кристина on 06.04.2022.
//

import Foundation
import Core

class LevelManager {
    private var levels: [Int: Level]

    init () {
        levels = [:]
    }

    func add(level: Level) {
        if levels[Int(level.number)] == nil {
            levels[Int(level.number)] = level
        }
    }

    subscript (index: Int) -> Level? {
        levels[index]
    }
}
