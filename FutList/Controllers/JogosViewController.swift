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
            if(selectedSegmented == 1) {
                self.tableGames = self.finishedGames
                DispatchQueue.main.async {
                    self.jogosView.gamesTableView.reloadData()
                }
            }
        }
    }

    var nextGames: ([String:[Match]], [String]) = ([:], []) {
        didSet {
            if(selectedSegmented == 0) {
                self.tableGames = self.nextGames
                DispatchQueue.main.async {
                    self.jogosView.gamesTableView.reloadData()
                }
            }
        }
    }

    var selectedSegmented = 0

    let filterMatches = FilterService()

    override func loadView() {
        let jogosView = JogosView()
        view = jogosView
    }

    var jogosView: JogosView {
        guard let jogosV = view as? JogosView else { return JogosView() }
        return jogosV
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Jogos"
        navigationController?.navigationBar.prefersLargeTitles = true

        getMatches()

        jogosView.render()
        jogosView.setSelectedSegment = setSelectedSegment
        jogosView.gamesTableView.delegate = self
        jogosView.gamesTableView.dataSource = self

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

    func setSelectedSegment(selectedIndex: Int) {
        if selectedIndex == 0 {
            tableGames = nextGames
            selectedSegmented = 0
            jogosView.gamesTableView.reloadData()
        } else {
            tableGames = finishedGames
            selectedSegmented = 1
            jogosView.gamesTableView.reloadData()
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
