//
//  PlayerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/23.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct PlayerRow: View {
    var name: String

    var body: some View {
        Text(name)
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(name: "a")
    }
}
