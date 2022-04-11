//
//  ButtonsSet.swift
//  Broken
//
//  Created by Mac on 06.04.2022.
//

import Foundation
import UIKit

class ButtonsSet {
    var buttons: [Button: Bool]
    init(all: Bool = true) {
        buttons = [:]
        for buttonCase in Button.allCases {
            buttons[buttonCase] = all
        }
    }
    init(activeButtons: [Button]) {
        buttons = [:]
        for button in Button.allCases {
            buttons[button] = false
        }
        for button in activeButtons {
            buttons[button] = true
        }
    }
}

extension ButtonsSet {
    subscript (index: Button) -> Bool {
        get {
            buttons[index] ?? false
        }
        set {
            buttons[index] = newValue
        }
    }
}
