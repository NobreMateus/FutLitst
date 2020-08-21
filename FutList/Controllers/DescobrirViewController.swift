//
//  DescobrirViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class DescobrirViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    let defaults = UserDefaults.standard

    let teamsTableView: UITableView = {
        let teamsTV = UITableView()
        return teamsTV
    }()

    let searchTeamBar: UISearchBar = {
        let teamBarSearch = UISearchBar()
        return teamBarSearch
    }()

    var teamsList: [Team] = [] {
        didSet {
            DispatchQueue.main.async {
                self.teamsTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        teamsTableView.dataSource = self
        teamsTableView.delegate = self

        searchTeamBar.delegate = self

        view.backgroundColor = .white
        title = "Jogos"
        navigationController?.navigationBar.prefersLargeTitles = true

        addTeamSearchBar()
        addTeamsTableView()
        addGestureToDismissSearchBar()

    }

    func followTeam(teamId: Int) {

        let teamsIds = defaults.object(forKey: "followedTeamsIdArray") as? [Int]

        if var teamsIdsIntArray = teamsIds {
            teamsIdsIntArray.append(teamId)
            defaults.set(teamsIdsIntArray, forKey: "followedTeamsIdArray")
        } else {
            defaults.set([teamId], forKey: "followedTeamsIdArray")
        }
    }

    func addTeamSearchBar() {

        view.addSubview(searchTeamBar)

        searchTeamBar.translatesAutoresizingMaskIntoConstraints = false
        searchTeamBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchTeamBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchTeamBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }

    func addTeamsTableView() {

        view.addSubview(teamsTableView)

        teamsTableView.translatesAutoresizingMaskIntoConstraints = false
        teamsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        teamsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        teamsTableView.topAnchor.constraint(equalTo: searchTeamBar.bottomAnchor, constant: 8).isActive = true
        teamsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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

        teamsRequest.getSearchedTeams { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let teams):
                self?.teamsList = teams
            }
        }
    }

    func addGestureToDismissSearchBar() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissSearchBar))
        view.addGestureRecognizer(tap)
    }

    @objc
    func dismissSearchBar() {
        searchTeamBar.endEditing(true)
    }

}
