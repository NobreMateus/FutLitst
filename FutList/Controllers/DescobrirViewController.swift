//
//  DescobrirViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
// swiftlint:disable force_cast

import UIKit

class DescobrirViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var followingTems: [FollowingTeams] = []
    let dataFilter = DataFilter()
    
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
        descobrirView.teamsTableView.allowsSelection = true

        //addGestureToDismissSearchBar()
    }

    func followTeam(team: Team) {
        let newFollowingTeam = FollowingTeams(context: self.context)
        newFollowingTeam.logoImagePath = team.logo
        newFollowingTeam.teamId = Int32(team.team_id)
        newFollowingTeam.teamName = team.name
        
        do {
            try context.save()
        } catch {
            print("erro")
        }
    }
    
    func unfollowTeam(team: Team) {
        
        let unfolTeam = dataFilter.getFirstTeamById(teamId: team.team_id)
        guard let unfollowTeam = unfolTeam else {return}
        self.context.delete(unfollowTeam)
        do {
            try context.save()
        } catch {
            print("erro")
        }
    }

}

extension DescobrirViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsList.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamTableViewCell = SearchedTeamsTableViewCell()
        teamTableViewCell.configure(team: teamsList[indexPath.row], onFollowButtonClick: followTeam, onUnfollowButtonClick: unfollowTeam)

        return teamTableViewCell
     }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        title.text = "Resultados: \(teamsList.count)"
        title.textColor = .white
        
        view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16).isActive = true
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.backgroundColor = .black
        return view
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        searchBar.endEditing(true)

        guard let searchBarText = searchBar.text else { return }
        let teamsRequest = TeamsRequest(textSearch: searchBarText )

        teamsRequest.getSearchedTeams(session: URLSession.shared) { teamsList in
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
