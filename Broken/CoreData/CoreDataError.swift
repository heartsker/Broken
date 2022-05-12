//
//  CoreDataError.swift
//  Broken
//
//  Created by Матвей Кузнецов on 02.05.2022.
//
import CoreData
import Foundation
enum CoreDataError: LocalizedError {
    case fetchingError(NSManagedObject.Type)

    var errorDescription: String? {
        switch self {
        case let .fetchingError(type):
            return "Failed to fetch entity of type \(type)"
        }
    }
}
