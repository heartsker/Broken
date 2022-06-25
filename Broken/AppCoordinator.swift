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

        let vc = MainViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func showLevels () {
        let vc = LevelsViewController()
        navigationController.pushViewController(vc, animated: false)

    }
    func showSettings () {
        let vc = SettingsViewController()
        navigationController.pushViewController(vc, animated: false)
    }

 }
