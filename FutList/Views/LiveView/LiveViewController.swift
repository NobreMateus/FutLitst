//
//  SeguindoViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class LiveMatchesViewController: UIViewController {
    
    let dataSource = LiveMatchDataSource()

    var seguindoView: LiveMatchesView {
        guard let seguindoV = view as? LiveMatchesView else { return LiveMatchesView() }
        return seguindoV
    }

    override func loadView() {
        let liveView = LiveMatchesView()
        view = liveView
    }
    
    lazy var viewModel : LiveViewModel = {
        let viewModel = LiveViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ao Vivo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        seguindoView.render()
        
        guard let liveView = self.view as? LiveMatchesView else {return}
        
        liveView.tableView.dataSource = self.dataSource
        liveView.tableView.delegate = self.dataSource
        
        
//        let refreshControl = UIRefreshControl()
//        refreshControl.attributedTitle = NSAttributedString(string: "Push to Refresh")
//        refreshControl.addTarget(self, action: #selector(pushTable), for: .valueChanged)
//        liveView.tableView.addSubview(refreshControl)
        
        self.dataSource.data.addAndNotify(observer: self) { () in
            DispatchQueue.main.async {
                liveView.tableView.reloadData()
            }
        }
        
        self.viewModel.fetchMatches()
    }
    
    @objc
    func pushTable(){
        guard let liveView = self.view as? LiveMatchesView else {return}
        self.dataSource.data = DynamicValue([])
        print("Aloha")
    }

}
