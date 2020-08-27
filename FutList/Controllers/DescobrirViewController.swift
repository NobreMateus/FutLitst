//
//  DescobrirViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class DescobrirViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var teamsList: [Team] = [] {
        didSet {
            DispatchQueue.main.async {
                self.descobrirView.teamsTableView.reloadData()
            }
        }
    }

    var descobrirView: DescobrirView {
        guard let descobrirV = view as? DescobrirView else { return DescobrirView() }
        return descobrirV
    }

    override func loadView() {
        let descobrirView = DescobrirView()
        view = descobrirView
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        title = "Jogos"
        navigationController?.navigationBar.prefersLargeTitles = true

        descobrirView.render()

        descobrirView.teamsTableView.dataSource = self
        descobrirView.teamsTableView.delegate = self

        descobrirView.searchTeamBar.delegate = self

        addGestureToDismissSearchBar()

    }

    func followTeam(teamId: Int) {

        let teamPersistence = TeamPersistence()
        teamPersistence.saveFollowedTeam(teamId: teamId)
    }

}

extension DescobrirViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsList.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamTableViewCell = SearchedTeamsTableViewCell()
        teamTableViewCell.configure(team: teamsList[indexPath.row], onFollowButtonClick: followTeam)

        return teamTableViewCell
     }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Resultados: \(teamsList.count)"
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        searchBar.endEditing(true)

        guard let searchBarText = searchBar.text else { return }
        let teamsRequest = TeamsRequest(textSearch: searchBarText )

        teamsRequest.getSearchedTeams { teamsList in
            self.teamsList = teamsList
        }
    }

    func addGestureToDismissSearchBar() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissSearchBar))
        descobrirView.addGestureRecognizer(tap)
    }

    @objc
    func dismissSearchBar() {
        descobrirView.searchTeamBar.endEditing(true)
    }

}
