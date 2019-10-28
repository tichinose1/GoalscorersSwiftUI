//
//  Goalscorers+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension Goalscorers {

    static func fetchLatest(completion: @escaping (Result<[Goalscorers], GoalscorersError>) -> Void) {
        Firestore
            .firestore()
            .collection("scorers")
            .whereField("season", isGreaterThan: "2018")
            .addSnapshotListener { snapshot, error in
                var result: Result<[Goalscorers], GoalscorersError>
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
                let items = snapshot.documents.map { Goalscorers(id: $0.documentID, data: $0.data()) }
                result = .success(items)
        }
    }

    var name: String {
        data["title"] as! String
    }

    var url: URL {
        URL(string: data["url"] as! String)!
    }

    func fetchCompetition(completion: @escaping (Result<Competition, GoalscorersError>) -> Void) {
        let competitionRef = data["competition_ref"] as! DocumentReference
        competitionRef.getDocument { snapshot, error in
            var result: Result<Competition, GoalscorersError>
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
            let competition = Competition(data: snapshot.data()!)
            result = .success(competition)
        }
    }
}
