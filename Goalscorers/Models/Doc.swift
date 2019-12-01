//
//  Doc.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/30.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

struct Doc<T: Decodable> {
    var documentID: String
    var reference: DocumentReference?
    var data: T
}

extension Doc: Identifiable {
    var id: String {
        documentID
    }
}
