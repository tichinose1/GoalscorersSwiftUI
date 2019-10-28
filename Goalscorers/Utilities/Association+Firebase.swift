//
//  Association+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension Association {

    static func fetchAll(completion: @escaping (Result<[Association], GoalscorersError>) -> Void) {
        Firestore.firestore().collection("associations").addSnapshotListener { snapshot, error in
            var result: Result<[Association], GoalscorersError>
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
            let items = snapshot.documents.map { Association(data: $0.data()) }
            result = .success(items)
        }
    }
}
