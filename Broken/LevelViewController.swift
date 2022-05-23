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

    var holder = UIView()

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

    private func buttonsPad () {
        let fontSize: CGFloat = 25
        let buttonSize: CGFloat = view.frame.size.width / 4

        let startButton = UIButton(frame: CGRect(x: 10, y: 15, width: buttonSize*3, height: buttonSize))
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .white
        startButton.setTitle("0", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Helvetica", size: fontSize)
        startButton.tag = 1
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)

        for value in 0..<9 {
            let buttonsRow = UIButton(frame: CGRect(x: buttonSize * CGFloat(value),
                                                    y: holder.frame.size.height-(buttonSize*2),
                                                    width: buttonSize-3,
                                                    height: buttonSize-3))
            buttonsRow.setTitleColor(.black, for: .normal)
            buttonsRow.backgroundColor = .gray
            buttonsRow.setTitle("\(value)", for: .normal)
            buttonsRow.tag = value+2
            holder.addSubview(buttonsRow)
            buttonsRow.addTarget(self, action: #selector (numberPressed(_:)), for: .touchUpInside)
        }
    }

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
        buttonsPad()
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
        view.addSubview(holder)
        // здесь пробегаемся по всему массиву
    }

    private func setupConstraints () {
        mainLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(mainLabel.snp.width).dividedBy(2)
        }
        holder.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(500)
            make.bottom.equalToSuperview()
        }
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }
}
