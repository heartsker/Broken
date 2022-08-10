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

let backGrColor = UIColor.systemIndigo

let level1 = Level(number: 1, name: "a", story: nil,
                   difficulty: 2.0, start: 1, finish: 10, bestScore: 10, buttons: ButtonsSet(activeButtons: []))
let level2 = Level(number: 2, name: "a", story: nil,
                   difficulty: 2.0, start: 1, finish: 10, bestScore: 10, buttons: ButtonsSet(activeButtons: []))
let data: [Level] = [level1, level2]

class LevelsViewController: UIViewController {
    var coordinator: AppCoordinator!

    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LevelCellView.self, forCellReuseIdentifier: "LevelCellView")
        return tableView
    }()

    let table: [Level] = LevelGenerator.getLevels()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        setup()
    }

    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //
    //    }
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

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCellView", for: indexPath) as! LevelCellView
        cell.level = table[indexPath.row]
        cell.clipsToBounds = true
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Was pressed cell No. \(indexPath.row)")
        coordinator.showLevelView(level: table[indexPath.row])
    }
}

class LevelCellView: UITableViewCell {

    var level: Level! {
        didSet {
            setup()
        }
    }

    private lazy var name: UILabel = {
        getLabel()
    }()

    private lazy var difficulty: UILabel = {
        getLabel()
    }()

    private lazy var bestScore: UILabel = {
        getLabel()
    }()

    func getLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        //        Pallete.Dark
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }

        self.name.text = String(level.number)
        contentView.addSubview(name)
        self.name.backgroundColor = backGrColor

        name.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(5.5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview()
        }

        self.difficulty.text = String(Double(Int(level.difficulty*1000000))/10000)
        contentView.addSubview(difficulty)
        self.difficulty.backgroundColor = backGrColor

        difficulty.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(2.2)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalTo(name.snp.right)

        }

        self.bestScore.text = String(level.bestScore)
        contentView.addSubview(bestScore)
        self.bestScore.backgroundColor = backGrColor

        bestScore.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalTo(difficulty.snp.right)
            make.right.equalToSuperview().offset(-15)
        }
    }
}
