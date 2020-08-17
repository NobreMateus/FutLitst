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

    }

    func configureCell(gameInfo: GameInfo) {
        let player1Label = UILabel()
        player1Label.text = gameInfo.player1

        let player2Label = UILabel()
        player2Label.text = gameInfo.player2

        let teamsSeparator = UILabel()
        teamsSeparator.text = "X"

        let teamsNameView = UIView()

        teamsNameView.addSubview(player1Label)
        teamsNameView.addSubview(player2Label)
        teamsNameView.addSubview(teamsSeparator)
        self.addSubview(teamsNameView)

        if let placar = gameInfo.placar {
            addPlacar(placar1: String(placar[0]), placar2: String(placar[1]), teamsNameView: teamsNameView)
        }

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
        teamsNameView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true

        addMoreInfoGame(estadio: gameInfo.estadio, horario: "12:00" , teamsNameView: teamsNameView, yReferenceView: teamsSeparator)
    }

    func addPlacar(placar1: String, placar2:String, teamsNameView: UIView) {

        let placar1Label = UILabel()
        placar1Label.text = placar1

        let placar2Label = UILabel()
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

    func addMoreInfoGame(estadio: String, horario: String, teamsNameView: UIView, yReferenceView: UIView) {

        let estadioLabel = UILabel()
        estadioLabel.text = estadio
        estadioLabel.font = estadioLabel.font.withSize(12)

        let horarioLabel = UILabel()
        horarioLabel.text = horario
        horarioLabel.font = horarioLabel.font.withSize(16)

        teamsNameView.addSubview(estadioLabel)
        estadioLabel.translatesAutoresizingMaskIntoConstraints = false
        estadioLabel.topAnchor.constraint(equalTo: yReferenceView.bottomAnchor, constant: 8).isActive = true
        estadioLabel.centerXAnchor.constraint(equalTo: teamsNameView.centerXAnchor).isActive = true

        teamsNameView.addSubview(horarioLabel)
        horarioLabel.translatesAutoresizingMaskIntoConstraints = false
        horarioLabel.topAnchor.constraint(equalTo: estadioLabel.bottomAnchor, constant: 0).isActive = true
        horarioLabel.centerXAnchor.constraint(equalTo: teamsNameView.centerXAnchor).isActive = true
    }

}
