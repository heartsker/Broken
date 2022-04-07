//
//  LevelManager.swift
//  Broken
//
//  Created by Кристина on 06.04.2022.
//

import Foundation

class LevelManager {
    private var levels: [Level]
    init () {
        levels = []
    }
    func add (level: Level) {
        if !levels.contains(where: { tmp in
            level.number == tmp.number
        }) {
            levels.append(level)
        }
    }
    subscript (index: Int) -> Level {
        levels[index]
    }
}
