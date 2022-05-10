//
//  Button.swift
//  Broken
//
//  Created by Mac on 04.04.2022.
//

import Foundation

enum Button: Int, CaseIterable {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case plus
    case minus
    case multiply
    case divide
    case point
    case sign
}
    
extension Button: CustomStringConvertible {
    var description: String {
        switch self {
        case .plus :
            return "+"
        case .minus :
            return "-"
        case .multiply :
            return "*"
        case .divide :
            return "􀅿"
        case .point :
            return "."
        case .sign :
            return "􀍶"
        default :
            return "\(rawValue)"
        }
    }
}

//for value in Button.allCases {
//    print(value)
//}
