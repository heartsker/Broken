//
//  ViewController.swift
//  Broken
//
//  Created by Daniel Pustotin on 28.03.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy private var label1: UILabel = {
        let label = UILabel()
        label.text = "This is label #1"
        label.font = UIFont.systemFont(ofSize: 30)
        label.backgroundColor = .black
        label.textColor = .white
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        return label
    }()

    lazy private var label2: UILabel = {
        let label = UILabel()
        label.text = "This is label #2"
        label.font = UIFont.systemFont(ofSize: 30)
        label.backgroundColor = .yellow
        label.textColor = .black
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setup()
    }

}

// MARK: - Setup
extension ViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupAppearance()
    }

    private func setupSubviews() {
        view.addSubview(label1)
        view.addSubview(label2)
    }

    private func setupConstraints() {
        label1.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(label1.snp.width).dividedBy(2)
        }

        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom)
            make.width.equalTo(label1.snp.width)
            make.height.equalTo(label1.snp.height)
            make.centerX.equalToSuperview()
        }
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }
}
