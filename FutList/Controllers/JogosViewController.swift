//
//  JogosViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class JogosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableGames: [Match] = []
    var finishedGames: [Match] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableGames = self.finishedGames
                self.gamesTableView.reloadData()
            }
        }
    }
    var nextGames: [Match] = [] {
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
                self?.nextGames = matches
                self?.finishedGames = matches
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
            tableGames = finishedGames
            gamesTableView.reloadData()
        } else {
            tableGames = nextGames
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
