//
//  PlayerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/23.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct PlayerRow: View {
    var item: Player

    var body: some View {
        Text(item.name)
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(item: Player(id: "a", data: ["name": "Lionel Messi"]))
    }
}
