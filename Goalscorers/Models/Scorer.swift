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
