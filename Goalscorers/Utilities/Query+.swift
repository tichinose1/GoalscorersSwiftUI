//
//  Query+.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/29.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

func fetchLatestScorers(completion: @escaping (Result<[Scorer], GoalscorersError>) -> Void) {
    Firestore.firestore().collection("scorers").whereField("season", isGreaterThan: "2018").fetch(completion: completion)
}

func fetchAllOverallScorers(completion: @escaping (Result<[OverallScorer], GoalscorersError>) -> Void) {
    Firestore.firestore().collection("overall_scorers").fetch(completion: completion)
}

func fetchAllPlayers(completion: @escaping (Result<[Player], GoalscorersError>) -> Void) {
    Firestore.firestore().collection("players").fetch(completion: completion)
}

func fetchAllAssociations(completion: @escaping (Result<[Association], GoalscorersError>) -> Void) {
    Firestore.firestore().collection("associations").fetch(completion: completion)
}

func fetchAllCompetitions(completion: @escaping (Result<[Competition], GoalscorersError>) -> Void) {
    Firestore.firestore().collection("competitions").fetch(completion: completion)
}

import FirebaseFirestoreSwift

private extension Query {

    func fetch<T: Decodable>(completion: @escaping (Result<[T], GoalscorersError>) -> Void) {
        addSnapshotListener { snapshot, error in
            var result: Result<[T], GoalscorersError>
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
                let items = try snapshot.documents.map { try $0.data(as: T.self)! }
                result = .success(items)
            } catch {
                result = .failure(.unknown)
            }
        }
    }
}
