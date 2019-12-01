//
//  OverallScorer.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/26.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct OverallScorer: Decodable {
    var url: URL
    var order: Int
    var competitionRef: DocumentReference?

    private enum CodingKeys: String, CodingKey {
        case url
        case order
        case competitionRef = "competition_ref"
    }
}

extension OverallScorer: Identifiable {

    var id: String {
        url.absoluteString
    }
}

extension OverallScorer {

    static var sample: OverallScorer {
        OverallScorer(
            url: URL(string: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players")!,
            order: 0
        )
    }

    static var samples: [OverallScorer] {
        return [
            OverallScorer(
                url: URL(string: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players")!,
                order: 0
            )
        ]
    }
}
