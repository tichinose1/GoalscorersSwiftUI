//
//  OverallGoalscorers+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension OverallGoalscorers {

    static func fetchAll(completion: @escaping (Result<[OverallGoalscorers], GoalscorersError>) -> Void) {
        Firestore.firestore().collection("overall_scorers").addSnapshotListener { snapshot, error in
            var result: Result<[OverallGoalscorers], GoalscorersError>
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
            let items = snapshot.documents.map { OverallGoalscorers(id: $0.documentID, data: $0.data()) }
            result = .success(items)
        }
    }

    var name: String {
        data["name"] as! String
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
