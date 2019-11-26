//
//  OverallScorer.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/26.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

struct OverallScorer: Decodable {
    var url: URL
    var order: Int
}

extension OverallScorer: Identifiable {

    var id: String {
        return url.absoluteString
    }
}
