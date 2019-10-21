//
//  QueryDocumentSnapshot+.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/21.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension QueryDocumentSnapshot: Identifiable {

    public var id: String {
        documentID
    }
}
