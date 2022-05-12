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
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return nil
            }
            var levels: [Level] = []
            for i in 1...json.count {
                guard let level = json["\(i)"] as? [String: Any],
                      let difficulty = level["difficulty"] as? Double,
                      let buttons = level["buttons"] as? [String],
                      let start = level["start"] as? Int,
                      let finish = level["finish"] as? Int,
                      let bestScore = level["bestScore"] as? Int else {
                    return nil
                }
                let number = i

                guard let level = convert(number: number,
                                          difficulty: difficulty,
                                          start: start,
                                          finish: finish,
                                          bestScore: bestScore,
                                          buttons: buttons) else {
                    return nil
                }

                levels.append(level)
            }
            return levels
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func convert(number: Int, difficulty: Double, start: Int, finish: Int,
                 bestScore: Int, buttons: [String]) -> Level? {

        func stringToButton(_ string: String) -> Button? {
            Button(rawValue: string)
        }
        var levelButtons: [Button] = []
        for string in buttons {
            guard let button = stringToButton(string) else {
                return nil}
            levelButtons.append(button)
        }

        let buttonsSet = ButtonsSet(activeButtons: levelButtons)

        return Level(number: number, difficulty: difficulty, start: start, finish: finish,
                     bestScore: bestScore, buttons: buttonsSet)
    }
}
