//
//  PCoordinator.swift
//  Broken
//
//  Created by Кристина on 18.04.2022.
//

import UIKit

protocol ICoordinator {
    var childCoordinators: [ICoordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
