//
//  SeguindoViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class SeguindoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let teamsPersistence = TeamPersistence()

    var teamsFollowed:[Int] = []

    var statistics: [Statistics] = [] {
        didSet {
            DispatchQueue.main.async {
                self.seguindoView.tableView.reloadData()
            }
        }
    }

    var seguindoView: SeguindoView {
        guard let seguindoV = view as? SeguindoView else { return SeguindoView() }
        return seguindoV
    }

    override func loadView() {
        let seguindoView = SeguindoView()
        view = seguindoView
    }

    override func viewDidAppear(_ animated: Bool) {
        let newFollowedTeams = teamsPersistence.getFollowedTeams()
        if newFollowedTeams.count != teamsFollowed.count {
            teamsFollowed = newFollowedTeams
            getStatistics()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        seguindoView.render()
        seguindoView.tableView.dataSource = self
        seguindoView.tableView.delegate = self
    }

    func getStatistics() {
        statistics = []
        for teamId in teamsFollowed {
            let statisticsRequest = StatisticsRequest(teamId: teamId, leagueId: 1396)
            statisticsRequest.getTeamStatisticsFromLeague { statistic in
                self.statistics.append(statistic)
            }
        }
    }

}

extension SeguindoViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statistics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statisticCell = SeguindoTableViewCell()
        statisticCell.render(statistic: statistics[indexPath.row])
        return statisticCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
