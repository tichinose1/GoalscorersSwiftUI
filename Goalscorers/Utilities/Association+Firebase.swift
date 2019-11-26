//
//  Association+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import CoreLocation
import Firebase
import FirebaseFirestoreSwift

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
            do {
                let items = try snapshot.documents.map { try $0.data(as: Association.self)! }
                result = .success(items)
            } catch {
                result = .failure(.unknown)
            }
        }
    }
}
