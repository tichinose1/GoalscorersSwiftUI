//
//  Association.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

struct Association: Decodable {
    var name: String
    var order: Int
    var regsion_code: String
}

extension Association: Identifiable {

    var id: String {
        return regsion_code
    }
}
