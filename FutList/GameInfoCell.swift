//
//  GameInfoCell.swift
//  FutList
//
//  Created by Mateus Nobre on 14/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class GameInfoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(player1Name: String, player2Name: String) {
        let player1Label = UILabel()
        player1Label.text = "Flamengo"

        let player2Label = UILabel()
        player2Label.text = "For"

        let teamsSeparator = UILabel()
        teamsSeparator.text = "X"

        let teamsNameView = UIView()

        teamsNameView.addSubview(player1Label)
        teamsNameView.addSubview(player2Label)
        teamsNameView.addSubview(teamsSeparator)
        self.addSubview(teamsNameView)

        player1Label.translatesAutoresizingMaskIntoConstraints = false
        player1Label.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -60).isActive = true
        player1Label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        player2Label.translatesAutoresizingMaskIntoConstraints = false
        player2Label.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 60).isActive = true
        player2Label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        teamsSeparator.translatesAutoresizingMaskIntoConstraints = false
        teamsSeparator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        teamsSeparator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        teamsNameView.translatesAutoresizingMaskIntoConstraints = false
        teamsNameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        teamsNameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        teamsNameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        teamsNameView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
    }

}
