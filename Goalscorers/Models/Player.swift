//
//  Player.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Player: Decodable {
    var url: URL
    var name: String
    var order: Int
    var associationRef: DocumentReference!
}

extension Player: Identifiable {

    var id: String {
        return url.absoluteString
    }
}

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
            do {
                let items = try snapshot.documents.map { try $0.data(as: Player.self)! }
                result = .success(items)
            } catch {
                result = .failure(.unknown)
            }
        }
    }

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
