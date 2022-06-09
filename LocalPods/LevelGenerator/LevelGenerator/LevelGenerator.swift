//
//  LevelGenerator.swift
//  LevelGenerator
//
//  Created by Daniel Pustotin on 14.04.2022.
//

import Foundation
import Core

public class LevelGenerator {

    /// Get levels from json
    /// - Returns: array of levels
    public static func getLevels() -> [Level] {
        guard let data = readLocalFile(forName: "levels"),
              let levels = parse(data: data) else {
                  return []
              }
        return levels
    }
   private static func resources() -> Bundle {
       let bundle = Bundle(for: Self.self)
            let url = bundle.url(forResource: "LevelGeneratorResources", withExtension: "bundle") ??
                      Bundle.main.resourceURL ?? URL(fileURLWithPath: "")
            let resourcesBundle = Bundle(url: url) ?? Bundle.main
            return resourcesBundle
        }
    private static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = LevelGenerator.resources().path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }

   private static func parse(data: Data) -> [Level]? {
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
                      let bestScore = level["best_score"] as? Int else {
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

    private static func convert(number: Int,
                                difficulty: Double,
                                start: Int,
                                finish: Int,
                                bestScore: Int,
                                buttons: [String]) -> Level? {

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

// swiftlint:disable:next cyclomatic_complexity
private func stringToButton(_ string: String) -> Button? {
    switch string {
    case "0":
        return .zero
    case "1":
        return .one
    case "2":
        return .two
    case "3":
        return .three
    case "4":
        return .four
    case "5":
        return .five
    case "6":
        return .six
    case "7":
        return .seven
    case "8":
        return .eight
    case "9":
        return .nine
    case "+":
        return .plus
    case "-":
        return .minus
    case "*":
        return .multiply
    case "/":
        return .divide
    case "*(-1)":
        return .sign
    default: return nil
    }
}
