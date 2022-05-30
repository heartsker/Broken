//
//  LevelsView.swift
//  Broken
//
//  Created by Кристина on 21.04.2022.
//

import SwiftUI
import LevelGenerator
import Core

let level1 = Level(number: 1, name: "a", story: nil,
                   difficulty: 2.0, start: 1, finish: 10, bestScore: 10, buttons: ButtonsSet(activeButtons: []))
let level2 = Level(number: 2, name: "a", story: nil,
                   difficulty: 2.0, start: 1, finish: 10, bestScore: 10, buttons: ButtonsSet(activeButtons: []))
let data: [Level] = [level1, level2]

class LevelsViewController: UIViewController {
    var coordinator: AppCoordinator?

    lazy private var tableView = UITableView(frame: .zero)

    let table: [Level] = LevelGenerator.getLevels()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LevelCellView.self, forCellReuseIdentifier: "LevelCellView")
        view.backgroundColor = UIColor.orange
        title = "LevelsView"
        tableView.dataSource = self
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
// отсюда
    // table.count не меняется
extension LevelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        table.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCellView", for: indexPath)
        as? LevelCellView ?? LevelCellView()
        cell.textLabel?.text = String(table[indexPath.row].number)
        print(cell.textLabel?.text)
        return cell
    }
}

class LevelCellView: UITableViewCell {

}
