//
//  OverallScorer.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/26.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct OverallScorer: Decodable {
    var url: URL
    var order: Int
    var competitionRef: DocumentReference!

    private enum CodingKeys: String, CodingKey {
        case url
        case order
        case competitionRef = "competition_ref"
    }
}

extension OverallScorer: Identifiable {

    var id: String {
        return url.absoluteString
    }
}

extension OverallScorer {

    static func fetchAll(completion: @escaping (Result<[OverallScorer], GoalscorersError>) -> Void) {
        Firestore.firestore().collection("overall_scorers").addSnapshotListener { snapshot, error in
            // TODO: ジェネリクスで共通化する
            var result: Result<[OverallScorer], GoalscorersError>
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
                let items = try snapshot.documents.map { try $0.data(as: OverallScorer.self)! }
                result = .success(items)
            } catch {
                result = .failure(.unknown)
            }
        }
    }

    // TODO: extensionで共通化する
    func fetchCompetition(completion: @escaping (Result<Competition, GoalscorersError>) -> Void) {
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
            do {
                let item = try snapshot.data(as: Competition.self)!
                result = .success(item)
            } catch {
                result = .failure(.unknown)
            }
        }
    }
}

extension OverallScorer {

    static var sample: OverallScorer {
        return
            OverallScorer(
                url: URL(string: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players")!,
                order: 0
            )
    }

    static var samples: [OverallScorer] {
        return [
            OverallScorer(
                url: URL(string: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players")!,
                order: 0
            )
        ]
    }
}
