//
//  LevelsView.swift
//  Broken
//
//  Created by Кристина on 21.04.2022.
//

import SwiftUI
import LevelGenerator
import Core
import SnapKit

let level1 = Level(number: 1, name: "a", story: nil,
                   difficulty: 2.0, start: 1, finish: 10, bestScore: 10, buttons: ButtonsSet(activeButtons: []))
let level2 = Level(number: 2, name: "a", story: nil,
                   difficulty: 2.0, start: 1, finish: 10, bestScore: 10, buttons: ButtonsSet(activeButtons: []))
let data: [Level] = [level1, level2]

class LevelsViewController: UIViewController {
    var coordinator: AppCoordinator?

    lazy private var tableView = UITableView()

    let table: [Level] = LevelGenerator.getLevels()

    override func viewDidLoad() {

        super.viewDidLoad()

        tableView.register(LevelCellView.self, forCellReuseIdentifier: "LevelCellView")
        view.backgroundColor = UIColor.orange
        title = "LevelsView"
        tableView.dataSource = self
        tableView.delegate = self

        setup()
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
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }

}

extension LevelsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        table.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCellView", for: indexPath) as! LevelCellView
        cell.level = table[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Was pressed cell No. \(indexPath.row)")
    }
}

class LevelCellView: UITableViewCell {
    var level: Level! {
        didSet {
            setup()
        }
    }

    private lazy var name: UILabel = {
        UILabel()
    }()

    private lazy var difficulty: UILabel = {
        UILabel()
    }()

    private lazy var bestScore: UILabel = {
        UILabel()
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        self.name.text = String(level.number)
        contentView.addSubview(name)
        self.name.backgroundColor = .blue

        name.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(6)
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview()
        }

        self.difficulty.text = String(level.difficulty)
        contentView.addSubview(difficulty)
        self.difficulty.backgroundColor = .red

        difficulty.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3)
            make.top.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalTo(name.snp.right)
            make.right.equalToSuperview()
        }

        self.bestScore.text = String(level.bestScore)
        contentView.addSubview(bestScore)

//        bestScore.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview()
//            make.top.equalToSuperview()
//            make.left
//            make.right.equalToSuperview()
//        }
    }
}
