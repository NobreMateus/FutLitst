import Foundation

struct LiveViewModel {
    
    weak var dataSource : GenericDataSource<LiveMatchResponse>?

        init(dataSource : GenericDataSource<LiveMatchResponse>?) {
            self.dataSource = dataSource
        }

        func fetchMatches() {
            let liveMatchesRequest = LivesMatchesRequest()
            liveMatchesRequest.getLiveMatches(session: URLSession.shared){ (liveMatches: [LiveMatchResponse]) in
               self.dataSource?.data.value = liveMatches
            }
        }
    
}
