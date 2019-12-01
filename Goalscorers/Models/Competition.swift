//
//  Competition.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase
import FirebaseFirestoreSwift

struct Competition: Decodable {
    var name: String
    var kind: String
    var order: Int
    var associationRef: DocumentReference?

    private enum CodingKeys: String, CodingKey {
        case name
        case kind
        case order
        case associationRef = "association_ref"
    }
}

extension Competition {

    static var sample: Competition {
        Competition(
            name: "Ligue 1",
            kind: "club",
            order: 0,
            associationRef: nil
        )
    }

    static var samples: [Competition] {
        return [
            Competition(
                name: "Ligue 1",
                kind: "club",
                order: 0,
                associationRef: nil
            )
        ]
    }
}
