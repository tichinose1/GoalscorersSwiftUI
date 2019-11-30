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

    func fetchAssociation(completion: @escaping (Result<Association, GoalscorersError>) -> Void) {
        associationRef?.fetch(completion: completion)
    }
}
