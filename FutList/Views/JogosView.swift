//
//  JogosView.swift
//  FutList
//
//  Created by Mateus Nobre on 25/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class JogosView: UIView {

    //var updateTable: ()->Void?

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
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func addGamesSegmentedControl() {
        self.addSubview(gamesSegmentedControl)

        let safeArea = self.safeAreaLayoutGuide

        gamesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        gamesSegmentedControl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        gamesSegmentedControl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        gamesSegmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8).isActive = true
    }

    func addGamesTableView() {
        self.addSubview(gamesTableView)

        gamesTableView.translatesAutoresizingMaskIntoConstraints = false
        gamesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        gamesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        gamesTableView.topAnchor.constraint(equalTo: gamesSegmentedControl.bottomAnchor, constant: 16).isActive = true
        gamesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }

    @objc
    func segmentedControlValueChanged(segment: UISegmentedControl) {
//        if segment.selectedSegmentIndex == 0 {
//            tableGames = nextGames
//            gamesTableView.reloadData()
//        } else {
//            tableGames = finishedGames
//            gamesTableView.reloadData()
//        }
    }

}
