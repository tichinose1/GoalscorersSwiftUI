//
//  Association.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import CoreLocation
import Firebase
import FirebaseFirestoreSwift

struct Association: Decodable {
    var regionCode: String
    var name: String
    var coordinate: GeoPoint
    var order: Int

    private enum CodingKeys: String, CodingKey {
        case regionCode = "region_code"
        case name
        case coordinate
        case order
    }
}

extension Association: Identifiable {

    var id: String {
        regionCode
    }
}

extension Association {

    static func fetchAll(completion: @escaping (Result<[Association], GoalscorersError>) -> Void) {
        Firestore.firestore().collection("associations").fetch(completion: completion)
    }

    func fetchCompetitions(completion: @escaping (Result<[Competition], GoalscorersError>) -> Void) {
        Firestore.firestore().collection("competitions").fetch(completion: completion)
    }
}

extension Association {

    static var sample: Association {
        Association(
            regionCode: "KR",
            name: "South Korea",
            coordinate: GeoPoint(latitude: 37.55, longitude: 126.966667),
            order: 0
        )
    }

    static var samples: [Association] {
        return [
            Association(
                regionCode: "KR",
                name: "South Korea",
                coordinate: GeoPoint(latitude: 37.55, longitude: 126.966667),
                order: 0
            )
        ]
    }
}
