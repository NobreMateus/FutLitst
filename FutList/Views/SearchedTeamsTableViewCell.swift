//
//  SearchedTeamsTableViewCell.swift
//  FutList
//
//  Created by Mateus Nobre on 19/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class SearchedTeamsTableViewCell: UITableViewCell {

    let teamImageView = UIImageView()
    let nameTeamLabel = UILabel()
    let followButton: UIButton = {
        let fButton = UIButton()
        fButton.setTitle("Seguir", for: .normal)
        fButton.backgroundColor = .blue
        fButton.titleLabel?.font = .systemFont(ofSize: 10)
        fButton.layer.cornerRadius = 4
        return fButton
    }()

    override func awakeFromNib() {

        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)
    }

    func configure(team: Team) {

        addTeamImageView(imageURL: team.logo)
        addTeamLabel(name: team.name)
        addFollowButton()
    }

    func addTeamLabel(name: String) {

        nameTeamLabel.text = name

        self.addSubview(nameTeamLabel)
        nameTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTeamLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameTeamLabel.leadingAnchor.constraint(equalTo: teamImageView.trailingAnchor, constant: 8).isActive = true
    }

    func addTeamImageView(imageURL: String) {

        self.addSubview(teamImageView)
        teamImageView.backgroundColor = .blue

        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        teamImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        teamImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        teamImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }

    func addFollowButton() {

        self.addSubview(followButton)

        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        followButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
    }

}
