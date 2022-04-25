//
//  PCoordinator.swift
//  Broken
//
//  Created by Кристина on 18.04.2022.
//

import UIKit

protocol PCoordinator {
    var childCoordinators: [PCoordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
