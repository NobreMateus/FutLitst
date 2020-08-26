//
//  SeguindoView.swift
//  FutList
//
//  Created by Mateus Nobre on 26/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class SeguindoView: UIView {

    let tableView: UITableView = {
        let tableV = UITableView()
        return tableV
    }()

    func render() {
        addTableViewToView()
        self.backgroundColor = .white
    }

    func addTableViewToView() {

        self.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }

}
