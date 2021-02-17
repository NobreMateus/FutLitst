//
//  JogosViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class JogosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let dateHandler = DateHandling()
    var tableGames: ([String:[Match]], [String]) = ([:], [])
    var finishedGames: ([String:[Match]], [String]) = ([:], []) {
        didSet {
            if(selectedSegmented == 1) {
                self.tableGames = self.finishedGames
                DispatchQueue.main.async {
                    self.jogosView.gamesTableView.reloadData()
                }
            }
        }
    }

    var nextGames: ([String:[Match]], [String]) = ([:], []) {
        didSet {
            if(selectedSegmented == 0) {
                self.tableGames = self.nextGames
                DispatchQueue.main.async {
                    self.jogosView.gamesTableView.reloadData()
                }
            }
        }
    }

    var selectedSegmented = 0

    let filterMatches = FilterService()

    var jogosView: JogosView {
        guard let jogosV = view as? JogosView else { return JogosView() }
        return jogosV
    }

    override func loadView() {
        let jogosView = JogosView()
        view = jogosView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Jogos"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        getMatches()

        jogosView.render()
        jogosView.setSelectedSegment = setSelectedSegment
        jogosView.gamesTableView.delegate = self
        jogosView.gamesTableView.dataSource = self

    }

    func getMatches() {
        let matchsRequest = MatchRequest(leagueId: 1396)
        matchsRequest.getMatchsFromLeague { (matches: [Match]) in

            let finishedGamesTemp = self.filterMatches.filterFinishedGames(matches: matches)
            let nextGamesTemp = self.filterMatches.filterNextGames(matches: matches)

            let nextGamesTuple = self.filterMatches.separateMatchesByDate(matches: nextGamesTemp)
            let finishedGamesTuple = self.filterMatches.separateMatchesByDate(matches: finishedGamesTemp)

            self.nextGames = nextGamesTuple
            self.finishedGames = finishedGamesTuple
        }
    }

    func setSelectedSegment(selectedIndex: Int) {
        if selectedIndex == 0 {
            tableGames = nextGames
            selectedSegmented = 0
            jogosView.gamesTableView.reloadData()
        } else {
            tableGames = finishedGames
            selectedSegmented = 1
            jogosView.gamesTableView.reloadData()
        }
    }
}

extension JogosViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedDates = self.selectedSegmented==0 ?
            dateHandler.sortDateStringAsc(dates: tableGames.1):
            dateHandler.sortDateStringDesc(dates: tableGames.1)
        
        guard let gameInfo = tableGames.0[sortedDates[section]] else {return 0}
        return gameInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gamesCell = GameInfoCell()
        let sortedDates = self.selectedSegmented==0 ?
            dateHandler.sortDateStringAsc(dates: tableGames.1):
            dateHandler.sortDateStringDesc(dates: tableGames.1)
        
        guard let gameInfo = tableGames.0[sortedDates[indexPath.section]]?[indexPath.row] else {return gamesCell}
        gamesCell.configureCell(gameInfo: gameInfo, cellNum: indexPath.item)
        return gamesCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableGames.1.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let sectionTitle = UILabel()
        let sortedDates = self.selectedSegmented==0 ?
            dateHandler.sortDateStringAsc(dates: tableGames.1):
            dateHandler.sortDateStringDesc(dates: tableGames.1)
        
        let dateString = sortedDates[section]
        view.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        sectionTitle.textColor = .white
        view.addSubview(sectionTitle)
        
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        sectionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        view.backgroundColor = .black
        
        let dateHandling = DateHandling()
        
        guard let dateTitle = dateHandling.formatStringDateToString(inFormatString: "dd-MM-yyyy", outFormatString: "dd/MM/yyyy", dateString: dateString) else {return view}
        
        guard let weekDay = dateHandling.dateStringToWeekDay(inFormatString: "dd-MM-yyyy", dateString: dateString) else {return view}
        
        sectionTitle.text = "\(dateTitle) - \(weekDay)"
        
        return view
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
