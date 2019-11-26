//
//  DocumentSnapshot+.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase
import FirebaseFirestoreSwift

extension DocumentSnapshot {

    func decode<T: Decodable>(_ type: T.Type) throws -> T {
//        return try data(as: type)!

        guard let data = data() else { fatalError() }
        let decoder = Firestore.Decoder()
        return try decoder.decode(type, from: data, in: reference)
    }
}
