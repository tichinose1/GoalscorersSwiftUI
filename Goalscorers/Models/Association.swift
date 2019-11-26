//
//  Association.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

struct Association: Decodable {
    var region_code: String
    var name: String
    var coordinate: GeoPoint
    var order: Int
}

extension Association: Identifiable {

    var id: String {
        return region_code
    }
}
