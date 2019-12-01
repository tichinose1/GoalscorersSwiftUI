//
//  DocumentReference+.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/30.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase
import FirebaseFirestoreSwift

extension DocumentReference {

    func fetch<T: Decodable>(completion: @escaping (Result<Doc<T>, GoalscorersError>) -> Void) {
        getDocument { snapshot, error in
            var result: Result<Doc<T>, GoalscorersError>
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
                let item = Doc(
                    documentID: snapshot.documentID,
                    reference: snapshot.reference,
                    data: try snapshot.data(as: T.self)!
                )
                result = .success(item)
            } catch {
                result = .failure(.unknown)
            }
        }
    }
}
