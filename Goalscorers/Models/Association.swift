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
