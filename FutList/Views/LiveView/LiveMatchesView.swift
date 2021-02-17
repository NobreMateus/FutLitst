import UIKit

class LiveMatchesView: UIView {

    let tableView: UITableView = {
        let tableV = UITableView()
        tableV.backgroundColor = .black
        return tableV
    }()

    func render() {
        addTableViewToView()
        self.backgroundColor = .black
        
    }

    func addTableViewToView() {

        self.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }

}
