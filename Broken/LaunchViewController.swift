//
//  LaunchViewController.swift
//  Broken
//
//  Created by Матвей Кузнецов on 23.05.2022.
//
//
// import Foundation
// import UIKit
// import SnapKit
// import Core
//
// class LaunchViewController: UIViewController {
//    var coordinator: AppCoordinator?
//    lazy private var mainLabel: UILabel = {
//        labelGood(enemies: "+")
//    }()
//
//    lazy private var additionalLabel: UILabel = {
//        labelGood(enemies: "-")
//    }()
//    lazy private var secondaryLabel: UILabel = {
//        labelGood(enemies: "=")
//    }()
//    lazy private var beautifulLabel: UILabel = {
//     labelGood(enemies: "/")
//    }()
//    lazy private var bigLabel: UIButton = {
//        let label = UIButton()
//        label.setTitle("PLAY", for: .normal)
//        label.setTitleColor(Pallete.Blue, for: .normal)
//        return label
//    }()
//
//    func labelGood(enemies: String) -> UILabel {
//        let label = UILabel()
//        label.text = enemies
//        label.textColor = Pallete.Dark
//        label.font = UIFont.systemFont(ofSize: 144)
//        label.textAlignment = .center
//        return label
//    }
//
//
//
//
//
//
//
//
//
//    lazy private var image: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "BackgroundImage")
//        return image
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
// }
// let startButton = UIButton
// startButton.setTitleColor(.black, for: .normal)
// startButton.backgroundColor = .white
// startButton.setTitle("+", for .normal)
//    extension MainViewController {
//        private func setup() {
//            setupSubviews()
//            setupConstraints()
//            setupAppearance()
//        }
//
//   private func setupSubviews() {
//    view.addSubview(image)
//
// }
//
// private func setupConstraints () {
//    image.snp.makeConstraints { make in
//        make.edges.equalToSuperview()
//    }
//
//        numbersButton.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(300)
//            make.height.equalTo(numbersButton.snp.width).dividedBy(2)
//        }
// }
//
// private func setupAppearance() {
//    view.backgroundColor = .white
// }
//
// }
