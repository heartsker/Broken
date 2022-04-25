//
//  HomeView.swift
//  Broken
//
//  Created by Кристина on 21.04.2022.
//

import UIKit

class HomeViewController: UIViewController {

    var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        title = "HomeView"

        let levelsButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        levelsButton.backgroundColor = .purple
        levelsButton.setTitle("Levels", for: .normal)
        levelsButton.addTarget(self, action: #selector(levelsButtonClicked), for: .touchUpInside)

        self.view.addSubview(levelsButton)
    }

    @objc func levelsButtonClicked () {
        coordinator?.showLevels()
    }

}
// struct HomeView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
// }
//
// struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
// }
