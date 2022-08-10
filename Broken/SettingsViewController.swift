//
//  SettingsViewController.swift
//  Broken
//
//  Created by Матвей Кузнецов on 16.06.2022.
//

import Foundation
import UIKit
import SnapKit
import Core
import SwiftUI

class SettingsViewController: UIViewController {
    var coordinator: AppCoordinator?

    lazy private var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 89)
        label.textAlignment = .center

        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
    extension SettingsViewController {
        private func setup() {
            setupSubviews()
            setupConstraints()
            setupAppearance()
        }
        private func setupSubviews() {
            view.addSubview(settingsLabel)
        }

    private func setupConstraints () {
       settingsLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
           make.height.equalTo(100)
           make.center.equalToSuperview()
       }

    }
        private func setupAppearance() {
            view.backgroundColor = .white
        }
    }
