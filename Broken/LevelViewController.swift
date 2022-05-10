//
//  LevelViewController.swift
//  Broken
//
//  Created by Кристина on 28.04.2022.
//

import UIKit
import SnapKit

class LevelViewController: UIViewController {

    var coordinator: AppCoordinator?

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

    private func button (for title: String) -> UIButton {
        let numbersButton = UIButton()
        numbersButton.setTitleColor(.white, for: .normal)
        numbersButton.backgroundColor = .darkGray
        numbersButton.frame = CGRect(x: 15, y: 30, width: 100, height: 100)
        numbersButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        numbersButton.setTitle(title, for: .normal)
        view.addSubview(numbersButton)
        return numbersButton

    }

    @objc func pressed () {
    }

    var buttons = [UIButton]()
// for buttons all cases
    private func createButtons () {
        for i in 0..<9 {
            buttons.append(button(for: "\(i)"))
        }
        buttons.append(button(for: "*"))
        buttons.append(button(for: "/"))
        buttons.append(button(for: "+"))
        buttons.append(button(for: "-"))
    }

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
        view.addSubview(button(for: "1"))
    }

    private func setupButtons () {
        mainLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(mainLabel.snp.width).dividedBy(2)
        }

//        numbersButton.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(300)
//            make.height.equalTo(numbersButton.snp.width).dividedBy(2)
//        }
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }

}
