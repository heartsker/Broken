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

    lazy private var numPad: UIView = {
        NumberPadView(buttons: Button.allCases)
    }()

    var coordinator: AppCoordinator!

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

    @objc func numberPressed (_ sender: UIButton) {
        _ = sender.tag - 1
    }

    @objc func startButtonTapped() {
    }

    var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension LevelViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupAppearance()
    }

    private func setupSubviews() {
        view.addSubview(mainLabel)
        view.addSubview(numPad)
    }

    private func setupConstraints () {
        mainLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(mainLabel.snp.width).dividedBy(2)
        }
        numPad.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(500)
            make.bottom.equalToSuperview().offset(-50)
        }
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }
}
