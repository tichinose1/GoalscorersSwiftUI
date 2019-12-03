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
