//
//  CoreDataHelper.swift
//  Broken
//
//  Created by Матвей Кузнецов on 02.05.2022.
//
import UIKit
import CoreData
import Core

class CoreDataManager {

    static let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    static let managedContext: NSManagedObjectContext = CoreDataManager.appDelegate.persistentContainer.viewContext

    static func save() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save Level. \(error), \(error.userInfo)")
        }
    }

//    static func fetch() throws -> [Level] {
//        do {
//            guard let object = try? managedContext.fetch(Level.fetchRequest()) else {
//                throw CoreDataError.fetchingError(Level.self)
//            }
//            return object
//        } catch {
//            throw CoreDataError.fetchingError(Level.self)
//        }
//    }
}
