//
//  Player+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension Player {

    static func fetchAll(completion: @escaping (Result<[Player], GoalscorersError>) -> Void) {
        Firestore.firestore().collection("players").addSnapshotListener { snapshot, error in
            var result: Result<[Player], GoalscorersError>
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
            let players = snapshot.documents.map { Player(id: $0.documentID, data: $0.data()) }
            result = .success(players)
        }
    }

    var name: String {
        data["name"] as! String
    }

    var url: URL {
        URL(string: data["url"] as! String)!
    }
}
