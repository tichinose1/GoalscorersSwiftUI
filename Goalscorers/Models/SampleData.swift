//
//  SampleData.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/03.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

enum SampleData {

    static let scorer = Doc<Scorer>(documentID: "1", reference: nil, data: Scorer.samples[0])
    static let scorers = Scorer.samples.enumerated().map { offset, element in Doc<Scorer>(documentID: "\(offset)", reference: nil, data: element) }
}

extension Scorer {

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
