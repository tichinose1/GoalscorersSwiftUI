//
//  GoalscorersError.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

enum GoalscorersError: Error {
    case database(origin: Error)
    case unknown
}
