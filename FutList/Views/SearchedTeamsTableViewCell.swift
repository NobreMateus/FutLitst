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
    let nameTeamLabel: UILabel = {
        let teamLabel = UILabel()
        teamLabel.textColor = .white
        return teamLabel
    }()
    
    let followButton: UIButton = {
        let fButton = UIButton()
        fButton.setTitle("Seguir", for: .normal)
        fButton.backgroundColor = UIColor(red: 175/255, green: 82/255, blue: 222/255, alpha: 1)
        fButton.titleLabel?.font = .systemFont(ofSize: 14)
        fButton.layer.cornerRadius = 4
        return fButton
    }()
    let dataFilter = DataFilter()
    var onFollowButtonClick: (( Team ) -> Void)?
    var onUnfollowButtonClick: (( Team ) -> Void)?
    var team: Team?
    var following = false
    
    override func awakeFromNib() {

        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)
    }

    func configure(team: Team, onFollowButtonClick: @escaping (Team) -> Void, onUnfollowButtonClick: @escaping (Team) -> Void) {
        self.following = dataFilter.followingTeamContain(teamId: team.team_id)
        addTeamImageView(imageURL: team.logo)
        addTeamLabel(name: team.name)
        addFollowButton(teamId: team.team_id)
        self.onFollowButtonClick = onFollowButtonClick
        self.onUnfollowButtonClick = onUnfollowButtonClick
        self.team = team
        self.backgroundColor = .black
        self.contentView.isUserInteractionEnabled = false
        self.selectionStyle = .none
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
        if let url = URL(string: imageURL) {
            teamImageView.load(url: url)
        }
        
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        teamImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        teamImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        teamImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }

    func addFollowButton(teamId: Int) {
        
        self.addSubview(followButton)

        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        followButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
    
        followButton.addTarget(self, action: #selector(self.followButtonAction(_:)), for: .touchUpInside)
        
        if(self.following) {
            changeFollowButtonToUnfollow()
        }

    }
    
    func changeFollowButtonToUnfollow() {
        followButton.setTitle("Unfollow", for: .normal)
        followButton.backgroundColor = UIColor(red: 200/255, green: 10/255, blue: 10/255, alpha: 1)
        followButton.removeTarget(self, action: nil, for: .touchUpInside)
        followButton.addTarget(self, action: #selector(self.unfollowButtonAction), for: .touchUpInside)
    }
    
    func changeUnfollowButtonToFollow() {
        followButton.setTitle("Seguir", for: .normal)
        followButton.backgroundColor = UIColor(red: 175/255, green: 82/255, blue: 222/255, alpha: 1)
        followButton.removeTarget(self, action: nil, for: .touchUpInside)
        followButton.addTarget(self, action: #selector(self.followButtonAction(_:)), for: .touchUpInside)
    }
    
    func startPulseAnimation() {
        let pulse = PulseAnimation(numberOfPulse: 1, radius: 50, postion: followButton.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = CGColor(red: 228/255, green: 174/255, blue: 255/255, alpha: 1)
        self.layer.insertSublayer(pulse, below: self.layer)
    }

    @objc
    func followButtonAction(_ sender:UIButton) {
        startPulseAnimation()
        guard let followButtonClicked = self.onFollowButtonClick else {return}
        if let cellTeam = self.team {
            changeFollowButtonToUnfollow()
            followButtonClicked(cellTeam)
        }
    }
    
    @objc
    func unfollowButtonAction() {
        startPulseAnimation()
        guard let unfollowButtonClicked = self.onUnfollowButtonClick else {return}
        if let cellTeam = self.team {
            self.changeUnfollowButtonToFollow()
            unfollowButtonClicked(cellTeam)
        }
    }

}
