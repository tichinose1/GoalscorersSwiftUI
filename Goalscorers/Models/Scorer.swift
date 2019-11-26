//
//  Scorer.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/26.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

struct Scorer: Decodable {
    var url: URL
    var title: String
    var season: String
    var order: Int
}

extension Scorer: Identifiable {

    var id: String {
        return url.absoluteString
    }
}

extension Scorer {

    static var samples: [Scorer] {
        return [
            Scorer(url: URL(string: "example")!, title: "a", season: "2019", order: 0)
        ]
    }
}
