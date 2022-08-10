//
//  NumberPadView.swift
//  Broken
//
//  Created by Кристина on 23.05.2022.
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
         button.backgroundColor = .blue
         button.frame = CGRect(x: 15, y: 15, width: 100, height: 75)
         button.layer.cornerRadius = 10
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
                     make.bottom.equalToSuperview().offset(-row * 5 - row * 50)
                     make.left.equalToSuperview().offset((col + 1) * 5 + col * 100)
                     make.width.equalTo(100)
                     make.height.equalTo(50)
                 }
             }
         }
     }

     private func setupAppearance() {}
 }
