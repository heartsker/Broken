//
//  LevelViewController.swift
//  Broken
//
//  Created by Кристина on 28.04.2022.
//

import UIKit
import SnapKit
import Core

class LevelViewController: UIViewController {

    var coordinator: AppCoordinator?

    var buttons: [Button] = Button.allCases

    lazy private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 40)
        label.backgroundColor = .black
        label.textColor = .white
        label.layer.cornerRadius = 15
        label.textAlignment = .right
        return label
    }()

    lazy private var pad: UIView = {
        NumberPadView(buttons: buttons)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension LevelViewController {
    private func setup() {
        setupSubviews()
        setupButtons()
        setupAppearance()
    }

    private func setupSubviews() {
        view.addSubview(mainLabel)
        view.addSubview(pad)
    }

    private func setupButtons () {
        mainLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(mainLabel.snp.width).dividedBy(2)
        }

        pad.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom)
        }
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }

}
