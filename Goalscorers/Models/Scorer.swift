//
//  Scorer.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

final class Scorer: Identifiable {
    var id: String
    var name: String
    var url: URL

    init(id: String, name: String, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
}
