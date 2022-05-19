//
//  LevelsView.swift
//  Broken
//
//  Created by Кристина on 21.04.2022.
//

import SwiftUI
import LevelGenerator
import Core

class LevelsViewController: UIViewController {
    var coordinator: AppCoordinator?

    lazy private var tableView = UITableView(frame: .zero)

    let table: [Level] = LevelGenerator.getLevels()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LevelCellView.self, forCellReuseIdentifier: "LevelCellView")
        view.backgroundColor = UIColor.orange
        title = "LevelsView"
        print(table)
    }
}
// UITableView
extension LevelsViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupAppearance()
    }

    private func setupSubviews() {
        view.addSubview(tableView)
    }

    private func setupConstraints () {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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

extension LevelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        table.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCellView", for: indexPath)
        as? LevelCellView ?? LevelCellView()
        cell.textLabel?.text = String(table[indexPath.row].number)
        return cell
    }
}

class LevelCellView: UITableViewCell {

}
