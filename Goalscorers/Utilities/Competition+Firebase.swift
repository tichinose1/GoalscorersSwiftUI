//
//  Competition+Firebase.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Firebase

extension Competition {

    var name: String {
        data["name"] as! String
    }
}
