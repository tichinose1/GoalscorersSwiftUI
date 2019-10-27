//
//  Scorer+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension Scorer {

    static func getLatestScorers(completion: @escaping (Result<[Scorer], GoalscorersError>) -> Void) {
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
                let scorers = snapshot.documents.map(Scorer.init)
                result = .success(scorers)
        }
    }

    init(snapshot: QueryDocumentSnapshot) {
        id = snapshot.documentID
        name = snapshot.data()["title"] as! String
        url = URL(string: snapshot.data()["url"] as! String)!
    }
}
