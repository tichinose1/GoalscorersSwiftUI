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

extension Player: Identifiable {

    var id: String {
        url.absoluteString
    }
}

extension Player {

    static var sample: Player {
        Player(
            url: URL(string: "https://en.wikipedia.org/wiki/Cristiano_Ronaldo#Career_statistics")!,
            name: "Cristiano Ronaldo",
            order: 0,
            associationRef: nil
        )
    }

    static var samples: [Player] {
        return [
            Player(
                url: URL(string: "https://en.wikipedia.org/wiki/Cristiano_Ronaldo#Career_statistics")!,
                name: "Cristiano Ronaldo",
                order: 0,
                associationRef: nil
            )
        ]
    }
}
