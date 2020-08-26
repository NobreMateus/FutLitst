//
//  SeguindoTableViewCell.swift
//  FutList
//
//  Created by Mateus Nobre on 26/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class SeguindoTableViewCell: UITableViewCell {

    let goalsAmount: UILabel = UILabel()

    let matchResult = MatchsResults(home: 12, away: 10, total: 22)

    var statistic: Statistics?

    func render(statistic: Statistics) {

        self.statistic = statistic
        addGoalsAmount()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addGoalsAmount() {

        guard let goalsDone = statistic?.goals.goalsFor.total else { return }

        goalsAmount.text = "Gols feitos: \(goalsDone)"

        self.addSubview(goalsAmount)
        goalsAmount.translatesAutoresizingMaskIntoConstraints = false
        goalsAmount.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        goalsAmount.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
