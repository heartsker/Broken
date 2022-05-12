//
//  ButtonsSet.swift
//  Broken
//
//  Created by Mac on 06.04.2022.
//

import Foundation

/// Set of Buttons
public class ButtonsSet {
    var buttons: [Button: Bool]
    init(all: Bool = true) {
        buttons = [:]
        for buttonCase in Button.allCases {
            buttons[buttonCase] = all
        }
    }
    /// Initializes ButtonsSet
    /// - Parameter activeButtons: Buttons to enable
   public init(activeButtons: [Button]) {
        buttons = [:]
        for button in Button.allCases {
            buttons[button] = false
        }
        for button in activeButtons {
            buttons[button] = true
        }
    }
}
