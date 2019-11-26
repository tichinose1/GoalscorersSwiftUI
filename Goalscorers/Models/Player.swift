//
//  Player.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

struct Player: Decodable {
    var url: URL
    var name: String
    var order: Int
}

extension Player: Identifiable {

    var id: String {
        return url.absoluteString
    }
}
