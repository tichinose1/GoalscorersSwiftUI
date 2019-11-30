//
//  Query+.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/29.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

extension Query {

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
