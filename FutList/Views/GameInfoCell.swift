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
    let player1Label = UILabel()
    let player2Label = UILabel()
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

    func configureCell(gameInfo: Match) {

        addTeamsAndSeparator(player1Name: gameInfo.homeTeam.team_name, player2Name: gameInfo.awayTeam.team_name)

        if let homeGoals = gameInfo.goalsHomeTeam, let awayGoals = gameInfo.goalsAwayTeam {
            addPlacar(placar1: String(homeGoals), placar2: String(awayGoals))
        }

        //addMoreInfoGame(estadio: gameInfo.venue, horario: gameInfo.event_date, yReferenceView: teamsSeparator)

    }

    func addTeamsAndSeparator(player1Name: String, player2Name: String) {

        player1Label.text = player1Name
        player2Label.text = player2Name
        teamsSeparator.text = "X"

        teamsNameView.addSubview(player1Label)
        teamsNameView.addSubview(player2Label)
        teamsNameView.addSubview(teamsSeparator)
        self.addSubview(teamsNameView)

        player1Label.translatesAutoresizingMaskIntoConstraints = false
        player1Label.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -60).isActive = true // Erro de constraint
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

}
