//
//  GameInfoCell.swift
//  FutList
//
//  Created by Mateus Nobre on 14/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class GameInfoCell: UITableViewCell {

    let teamsNameView = UIView()
    let teamsSeparator = UILabel()
    let placar1Label = UILabel()
    let placar2Label = UILabel()
    let estadioLabel = UILabel()
    let horarioLabel = UILabel()

    override func awakeFromNib() {

        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)
    }

    func configureCell(gameInfo: Match, cellNum: Int) {

        addTeamsAndSeparator(player1Name: gameInfo.homeTeam.team_name, player2Name: gameInfo.awayTeam.team_name)

        if let homeGoals = gameInfo.goalsHomeTeam, let awayGoals = gameInfo.goalsAwayTeam {
            addPlacar(placar1: String(homeGoals), placar2: String(awayGoals))
        }

        self.backgroundColor = cellBackgroundColorSelection(cellNum: cellNum)
    }
    
    func cellBackgroundColorSelection(cellNum: Int) -> UIColor {
        
        let divisionRest = cellNum % 2
        
        if(divisionRest == 1) {
            return UIColor(red: 0/255, green: 47/255, blue: 13/255, alpha: 1)
        } else {
            return UIColor(red: 0/255, green: 65/255, blue: 18/255, alpha: 1)
        }
    }

    func addTeamsAndSeparator(player1Name: String, player2Name: String) {
        
        let player1View = teamInfoView(name: player1Name, imagePath: "")
        let player2View = teamInfoView(name: player2Name, imagePath: "")

        teamsSeparator.text = "X"

        teamsNameView.addSubview(player1View)
        teamsNameView.addSubview(player2View)
        teamsNameView.addSubview(teamsSeparator)
        self.addSubview(teamsNameView)

        player1View.translatesAutoresizingMaskIntoConstraints = false
        player1View.widthAnchor.constraint(equalTo: teamsNameView.widthAnchor, multiplier: 0.35).isActive = true
        player1View.leadingAnchor.constraint(equalTo: teamsNameView.leadingAnchor, constant: 16).isActive = true
        player1View.heightAnchor.constraint(equalTo: teamsNameView.heightAnchor).isActive = true
    
        player2View.translatesAutoresizingMaskIntoConstraints = false
        player2View.widthAnchor.constraint(equalTo: teamsNameView.widthAnchor, multiplier: 0.35).isActive = true
        player2View.trailingAnchor.constraint(equalTo: teamsNameView.trailingAnchor, constant: -16).isActive = true
        player2View.heightAnchor.constraint(equalTo: teamsNameView.heightAnchor).isActive = true
        
        teamsSeparator.translatesAutoresizingMaskIntoConstraints = false
        teamsSeparator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        teamsSeparator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        teamsNameView.translatesAutoresizingMaskIntoConstraints = false
        teamsNameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        teamsNameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        teamsNameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        teamsNameView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }

    func addPlacar(placar1: String, placar2:String) {

        placar1Label.text = placar1
        placar2Label.text = placar2

        teamsNameView.addSubview(placar1Label)
        placar1Label.translatesAutoresizingMaskIntoConstraints = false
        placar1Label.centerYAnchor.constraint(equalTo: teamsNameView.centerYAnchor).isActive = true
        placar1Label.trailingAnchor.constraint(equalTo: teamsNameView.centerXAnchor, constant: -24).isActive = true

        teamsNameView.addSubview(placar2Label)
        placar2Label.translatesAutoresizingMaskIntoConstraints = false
        placar2Label.centerYAnchor.constraint(equalTo: teamsNameView.centerYAnchor).isActive = true
        placar2Label.leadingAnchor.constraint(equalTo: teamsNameView.centerXAnchor, constant: 24).isActive = true
    }

    func addMoreInfoGame(estadio: String?, horario: String, yReferenceView: UIView) {

        horarioLabel.text = horario
        horarioLabel.font = horarioLabel.font.withSize(16)

        teamsNameView.addSubview(horarioLabel)
        horarioLabel.translatesAutoresizingMaskIntoConstraints = false
        horarioLabel.topAnchor.constraint(equalTo: estadioLabel.bottomAnchor, constant: 0).isActive = true
        horarioLabel.centerXAnchor.constraint(equalTo: teamsNameView.centerXAnchor).isActive = true

        if let estadioValue = estadio {
            estadioLabel.text = estadioValue
            estadioLabel.font = estadioLabel.font.withSize(12)

            teamsNameView.addSubview(estadioLabel)
            estadioLabel.translatesAutoresizingMaskIntoConstraints = false
            estadioLabel.topAnchor.constraint(equalTo: yReferenceView.bottomAnchor, constant: 8).isActive = true
            estadioLabel.centerXAnchor.constraint(equalTo: teamsNameView.centerXAnchor).isActive = true
        }
    }
    
    func teamInfoView(name: String, imagePath: String) -> UIView {
        
        let infoView = UIView()
        let playerName = UILabel()
        let playerImage = UIImageView()
        
        playerName.text = name
        playerName.numberOfLines = 0
        playerName.textAlignment = .center
        playerName.textColor = .white
        playerImage.backgroundColor = .black
        
        infoView.addSubview(playerImage)
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        playerImage.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        playerImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 8).isActive = true
        playerImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playerImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        infoView.addSubview(playerName)
        playerName.translatesAutoresizingMaskIntoConstraints = false
        playerName.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        playerName.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 4).isActive = true
        playerName.widthAnchor.constraint(equalTo: infoView.widthAnchor, constant: -8).isActive = true
        
        return infoView
    }

}
