//
//  Scorer.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/26.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Scorer: Decodable {
    var url: URL
    var title: String
    var season: String
    var order: Int
    var competitionRef: DocumentReference!

    private enum CodingKeys: String, CodingKey {
        case url
        case title
        case season
        case order
        case competitionRef = "competition_ref"
    }
}

extension Scorer: Identifiable {

    var id: String {
        return url.absoluteString
    }
}

extension Scorer {

    static func fetchLatest(completion: @escaping (Result<[Scorer], GoalscorersError>) -> Void) {
        Firestore
            .firestore()
            .collection("scorers")
            .whereField("season", isGreaterThan: "2018")
            .addSnapshotListener { snapshot, error in
                var result: Result<[Scorer], GoalscorersError>
                defer {
                    completion(result)
                }
                if let error = error {
                    result = .failure(.database(origin: error))
                    return
                }
                guard let snapshot = snapshot else {
                    result = .failure(.unknown)
                    return
                }
                do {
                    let items = try snapshot.documents.map { try $0.data(as: Scorer.self)! }
                    result = .success(items)
                } catch {
                    result = .failure(.unknown)
                }
        }
    }
}

extension Scorer {

    static var sample: Scorer {
        return Scorer(url: URL(string: "https://en.wikipedia.org/wiki/2004_Copa_Am%C3%A9rica#Goal_scorers")!, title: "2004 Copa América", season: "2004", order: 0, competitionRef: nil)
    }

    static var samples: [Scorer] {
        return [
            Scorer(url: URL(string: "https://en.wikipedia.org/wiki/2004_Copa_Am%C3%A9rica#Goal_scorers")!, title: "2004 Copa América", season: "2004", order: 0, competitionRef: nil)
        ]
    }
}
