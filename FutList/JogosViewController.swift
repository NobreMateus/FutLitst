//
//  JogosViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class JogosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let mockedFinishedGames: [GameInfo] = [
        GameInfo(player1: "Sao Paulp", player2: "Flamego", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 10), placar: [0, 0]),
        GameInfo(player1: "Fortaleza", player2: "Ceara", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 10), placar: [3, 3]),
        GameInfo(player1: "Sao Paulp", player2: "Flamego", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 10), placar: [2, 1]),
        GameInfo(player1: "Sao Paulp", player2: "Flamego", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 10), placar: [0, 3])
    ]

    let mockedNextGames: [GameInfo] = [
        GameInfo(player1: "Botafogo", player2: "Flamego", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 10), placar: nil),
        GameInfo(player1: "Avai", player2: "Ceara", estadio: "Castelao", horario: Date(timeIntervalSince1970: 10), placar: nil),
        GameInfo(player1: "Fluminense", player2: "Flamego", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 1), placar: nil),
        GameInfo(player1: "Gremio", player2: "Flamego", estadio: "Morumbi", horario: Date(timeIntervalSince1970: 10), placar: nil)
    ]

    var tableGames: [GameInfo] = []

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

        tableGames = mockedFinishedGames

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
            tableGames = mockedFinishedGames
            gamesTableView.reloadData()
        } else {
            tableGames = mockedNextGames
            gamesTableView.reloadData()
        }
    }
}

extension JogosViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableGames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gamesCell = GameInfoCell()
        let gameInfo = tableGames[indexPath.row]
        gamesCell.configureCell(gameInfo: gameInfo)
        return gamesCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "14/08/2020 - Sexta-feira"
    }

}
