//
//  Button.swift
//  Broken
//
//  Created by Mac on 04.04.2022.
//

import Foundation

public enum Button: String, CaseIterable {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus
    case minus
    case multiply
    case divide
    case sign
}

extension Button: CustomStringConvertible {
   public var description: String {
        switch self {

        case .plus :
            return "+"
        case .minus :
            return "-"
        case .multiply :
            return "*"
        case .divide :
            return "/"
        case .point :
            return "."
        case .sign :
            return "􀍶"
        default :

            return String(Button.allCases.map { $0.rawValue }.firstIndex(of: self.rawValue) ?? 0)

        }
    }
}

// for value in Button.allCases {
//    print(value)
// }
