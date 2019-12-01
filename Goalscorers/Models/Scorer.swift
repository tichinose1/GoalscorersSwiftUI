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
    // TODO: 初期化出来ないのでOptionalにする
    var competitionRef: DocumentReference?

    private enum CodingKeys: String, CodingKey {
        case url
        case title
        case season
        case order
        case competitionRef = "competition_ref"
    }
}

extension Scorer {

    static var sample: Scorer {
        Scorer(
            url: URL(string: "https://en.wikipedia.org/wiki/2004_Copa_Am%C3%A9rica#Goal_scorers")!,
            title: "2004 Copa América",
            season: "2004",
            order: 0
        )
    }

    static var samples: [Scorer] {
        [
            Scorer(
                url: URL(string: "https://en.wikipedia.org/wiki/2004_Copa_Am%C3%A9rica#Goal_scorers")!,
                title: "2004 Copa América",
                season: "2004",
                order: 0
            )
        ]
    }
}
