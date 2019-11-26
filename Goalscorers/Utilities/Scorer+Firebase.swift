//
//  Scorer+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/26.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase
import FirebaseFirestoreSwift

extension Scorer {
    
    static func fetchLatest(completion: @escaping (Result<[Scorer], GoalscorersError>) -> Void) {
        Firestore
            .firestore()
            .collection("scorers")
            .whereField("season", isGreaterThan: "2018")
            .addSnapshotListener { snapshot, error in
                var result: Result<[Scorer], GoalscorersError>
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
                    let items = try snapshot.documents.map { try $0.data(as: Scorer.self)! }
                    result = .success(items)
                } catch {
                    result = .failure(.unknown)
                }
        }
    }
}
