//
//  JogosViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class JogosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableGames: ([String:[Match]], [String]) = ([:], [])
    var finishedGames: ([String:[Match]], [String]) = ([:], []) {
        didSet {
            DispatchQueue.main.async {
//                self.tableGames = self.finishedGames
//                self.gamesTableView.reloadData()
            }
        }
    }
    var nextGames: ([String:[Match]], [String]) = ([:], []) {
        didSet {
            DispatchQueue.main.async {
                self.tableGames = self.nextGames
                self.gamesTableView.reloadData()
            }
        }
    }

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

    let filterMatches = FilterService()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Jogos"
        navigationController?.navigationBar.prefersLargeTitles = true

        getMatches()

        addGamesSegmentedControl()
        addGamesTableView()

        gamesTableView.delegate = self
        gamesTableView.dataSource = self
    }

    func getMatches() {
        let matchsRequest = MatchRequest(leagueId: 1396)
        matchsRequest.getMatchsFromLeague { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let matches):

                guard let finishedGamesTemp = self?.filterMatches.filterFinishedGames(matches: matches) else {return}
                guard let nextGamesTemp = self?.filterMatches.filterNextGames(matches: matches) else {return}

                guard let nextGamesTuple = self?.filterMatches.separateMatchesByDate(matches: nextGamesTemp) else {return}
                guard let finishedGamesTuple = self?.filterMatches.separateMatchesByDate(matches: finishedGamesTemp) else {return}

                self?.nextGames = nextGamesTuple
                self?.finishedGames = finishedGamesTuple
            }
        }
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
            tableGames = nextGames
            gamesTableView.reloadData()
        } else {
            tableGames = finishedGames
            gamesTableView.reloadData()
        }
    }
}

extension JogosViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let gameInfo = tableGames.0[tableGames.1[section]] else {return 0}
        return gameInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gamesCell = GameInfoCell()

        guard let gameInfo = tableGames.0[tableGames.1[indexPath.section]]?[indexPath.row] else {return gamesCell}
        gamesCell.configureCell(gameInfo: gameInfo)
        return gamesCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableGames.1.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableGames.1[section]
    }

}
