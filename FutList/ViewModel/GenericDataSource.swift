import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class LiveMatchDataSource : GenericDataSource<LiveMatchResponse>, UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GameInfoCell()
        let matchResponse = self.data.value[indexPath.row]
        let match = transformMatchResponseToMatch(matchResponse: matchResponse)
        cell.configureCell(gameInfo: match, cellNum: indexPath.row)
        return cell
    }
    
    private func transformMatchResponseToMatch(matchResponse: LiveMatchResponse) -> Match {
        let homeTeam = MatchTeam(team_id: matchResponse.teams.home.id, team_name: matchResponse.teams.home.name, logo: matchResponse.teams.home.logo)
        let awayTeam = MatchTeam(team_id: matchResponse.teams.away.id, team_name: matchResponse.teams.away.name, logo: matchResponse.teams.away.logo)
        let match = Match(fixture_id: matchResponse.fixture.id,
                          league_id: 0,
                          event_date: matchResponse.fixture.date,
                          statusShort: "",
                          elapsed: 0,
                          venue: "",
                          referee: matchResponse.fixture.referee,
                          homeTeam: homeTeam,
                          awayTeam: awayTeam,
                          goalsHomeTeam: matchResponse.goals.home,
                          goalsAwayTeam: matchResponse.goals.away)
        return match
    }
    
}
