//
//  JogosViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class JogosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let gamesSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Próximos","Terminados"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for:.valueChanged)
        return segmentedControl
    }()

    let gamesTableView: UITableView = {
        let gamesTv = UITableView()
        return gamesTv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Jogos"
        navigationController?.navigationBar.prefersLargeTitles = true

        addGamesSegmentedControl()
        addGamesTableView()

        gamesTableView.delegate = self
        gamesTableView.dataSource = self
    }

    func addGamesSegmentedControl() {

        view.addSubview(gamesSegmentedControl)

        let safeArea = view.safeAreaLayoutGuide

        gamesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        gamesSegmentedControl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        gamesSegmentedControl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        gamesSegmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8).isActive = true
    }

    func addGamesTableView() {

        view.addSubview(gamesTableView)

        gamesTableView.translatesAutoresizingMaskIntoConstraints = false
        gamesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        gamesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        gamesTableView.topAnchor.constraint(equalTo: gamesSegmentedControl.bottomAnchor, constant: 16).isActive = true
        gamesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    @objc
    func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            print("0")
        } else {
            print("1")
        }
    }
}

extension JogosViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let gamesCell = GameInfoCell()

        let gameInfo = GameInfo(
            player1: "Sao Paulo",
            player2: "Flamengo",
            estadio: "Morumbi",
            horario: Date(timeIntervalSince1970: 0),
            placar: [0, 0]
        )

        gamesCell.configureCell(gameInfo: gameInfo)

        return gamesCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "14/08/2020 - Sexta-feira"
    }

}
