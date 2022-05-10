//
//  AppCoordinator.swift
//  Broken
//
//  Created by Кристина on 18.04.2022.
//

import UIKit

class AppCoordinator: ICoordinator {

    var childCoordinators: [ICoordinator]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }

    func start() {
        let controller = HomeViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }

    func showLevels () {
        let controller = LevelsViewController()
        navigationController.pushViewController(controller, animated: false)
    }

 }
