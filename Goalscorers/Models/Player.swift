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
    var associationRef: DocumentReference?

    private enum CodingKeys: String, CodingKey {
        case url
        case name
        case order
        case associationRef = "association_ref"
    }
}
