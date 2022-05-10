//
//  AppCoordinator.swift
//  Broken
//
//  Created by Кристина on 18.04.2022.
//

import UIKit

class AppCoordinator: PCoordinator {

    var childCoordinators: [PCoordinator]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }

    func start() {
        let vc = LevelViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func showLevels () {
        let vc = LevelViewController()
        navigationController.pushViewController(vc, animated: false)
    }

 }
