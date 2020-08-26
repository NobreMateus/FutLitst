//
//  DescobrirView.swift
//  FutList
//
//  Created by Mateus Nobre on 26/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class DescobrirView: UIView {

    let teamsTableView: UITableView = {
        let teamsTV = UITableView()
        return teamsTV
    }()

    let searchTeamBar: UISearchBar = {
        let teamBarSearch = UISearchBar()
        return teamBarSearch
    }()

    func render() {
        self.backgroundColor = .white
        addTeamSearchBar()
        addTeamsTableView()
    }

    func addTeamSearchBar() {

        self.addSubview(searchTeamBar)

        searchTeamBar.translatesAutoresizingMaskIntoConstraints = false
        searchTeamBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        searchTeamBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        searchTeamBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }

    func addTeamsTableView() {

        self.addSubview(teamsTableView)

        teamsTableView.translatesAutoresizingMaskIntoConstraints = false
        teamsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        teamsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        teamsTableView.topAnchor.constraint(equalTo: searchTeamBar.bottomAnchor, constant: 8).isActive = true
        teamsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
