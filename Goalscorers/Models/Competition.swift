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
    var associationRef: DocumentReference

    private enum CodingKeys: String, CodingKey {
        case name
        case kind
        case order
        case associationRef = "association_ref"
    }
}

extension Competition {

    func fetchAssociation(completion: @escaping (Result<Association, GoalscorersError>) -> Void) {
        associationRef.getDocument { snapshot, error in
            var result: Result<Association, GoalscorersError>
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
                let item = try snapshot.data(as: Association.self)!
                result = .success(item)
            } catch {
                result = .failure(.unknown)
            }
        }
    }
}
