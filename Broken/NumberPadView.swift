//
//  NumberPadView.swift
//  Broken
//
//  Created by Daniel Pustotin on 19.05.2022.
//

import UIKit
import Core

class NumberPadView: UIView {
    var configuration: [Button]

    init(buttons configuration: [Button]) {
        self.configuration = configuration

        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var buttons: [UIButton] = []

    private func getButton(with title: String) -> UIButton {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.frame = CGRect(x: 15, y: 30, width: 100, height: 100)
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        button.setTitle(title, for: .normal)
        return button
    }

    @objc private func pressed() {
    }
}

extension NumberPadView {
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupAppearance()
    }

    private func setupSubviews() {
        for button in Button.allCases {
            let uiButton = getButton(with: button.rawValue)
            buttons.append(uiButton)
            addSubview(uiButton)
        }
    }

    private func setupConstraints() {
        for row in 0 ..< 4 {
            for col in 0 ..< 4 {
                let idx = row * 4 + col
                buttons[idx].snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(row * 5 + row * 100)
                    make.left.equalToSuperview().offset(col * 5 + col * 100)
                    make.width.height.equalTo(100)
                }
            }
        }
    }

    private func setupAppearance() {}
}
