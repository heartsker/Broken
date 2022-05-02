//
//  LevelGenerator.swift
//  LevelGenerator
//
//  Created by Daniel Pustotin on 14.04.2022.
//

import Foundation
import Core

class LevelGenerator {
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }

    func parse(data: Data) throws -> [Level]? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                var levels: [Level] = []
                for i in 1...json.count {
                    guard let level = json["\(i)"] as? [String: Any],
                          let difficulty = level["difficulty"] as? Double,
                          let buttons = level["buttons"] as? [String],
                          let start = level["start"] as? Int,
                          let finish = level["finish"] as? Int,
                          let best_score = level["best_score"] as? Int else {
                              return nil
                          }
                    //                    level[i] = Level(difficulty: difficulty, buttons: buttons, start: start, finish: finish, best_score: best_score)
                    levels.append(convert(difficulty: difficulty, buttons: buttons, start: start, finish: finish, best_score: best_score))
                }
            }
        } catch let error as NSError {
            print("Failed to load")
        }
    }

    func convert(difficulty: Double, buttons: [String], start: Int, finish: Int, best_score: Int) -> Level? {
        var levelButtons: [Button]

        func stringToButton(_ string: String) -> Button? {
            Button(rawValue: string)
        }
        var levelButtons: [Button] = buttons.map { stringToButton($0) }
        let buttonsSet = ButtonsSet(activeButtons: levelButtons)
    return Level(difficulty: difficulty, buttons: buttonsSet, start: start, finish: finish, best_score: best_score)
    }
}
