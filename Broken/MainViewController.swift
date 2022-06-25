//
//  MainViewController.swift
//  Broken
//
//  Created by Матвей Кузнецов on 16.05.2022.
//

import Foundation
import UIKit
import SnapKit
import Core

class MainViewController: UIViewController {
    var coordinator: AppCoordinator?
    lazy private var plusLabel: UILabel = {
        labelGood(call: "+")
    }()

    lazy private var minusLabel: UILabel = {
        labelGood(call: "-")
    }()
    lazy private var equalsLabel: UILabel = {
        labelGood(call: "=")
    }()
    lazy private var slashLabel: UILabel = {
        labelGood(call: "/")
    }()

    lazy private var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("PLAY", for: .normal)
        button.setTitleColor(Pallete.Blue, for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    @objc func playButtonTapped() {
        coordinator?.showLevels()
    }

    func labelGood(call: String) -> UILabel {
        let label = UILabel()
        label.text = call
        label.textColor = Pallete.Dark
        label.font = UIFont.systemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }

    lazy private var settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("SETTINGS", for: .normal)
        button.setTitleColor(Pallete.White, for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()

   @objc func settingsButtonTapped() {
        coordinator?.showSettings()
    }

    lazy private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BackgroundImage")
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    // let startButton = UIButton
    // startButton.setTitleColor(.black, for: .normal)
    // startButton.backgroundColor = .white
    // startButton.setTitle("+", for .normal)
}
extension MainViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupAppearance()
    }

    private func setupSubviews() {
        view.addSubview(image)
        view.addSubview(plusLabel)
        view.addSubview(minusLabel)
        view.addSubview(equalsLabel)
        view.addSubview(slashLabel)
        view.addSubview(playButton)
        view.addSubview(settingsButton)
    }

    private func setupConstraints () {
            image.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        plusLabel.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(30)
        }
        minusLabel.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        equalsLabel.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.bottom.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
        }
        slashLabel.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.bottom.equalToSuperview().offset(-30)
            make.right.equalToSuperview().offset(-30)
        }
        playButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
        settingsButton.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.equalTo(playButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        //        numbersButton.snp.makeConstraints { make in
        //            make.center.equalToSuperview()
        //            make.width.equalTo(300)
        //            make.height.equalTo(numbersButton.snp.width).dividedBy(2)
        //        }
    }

    private func setupAppearance() {
        view.backgroundColor = .black
    }

}
