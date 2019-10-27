//
//  ScorerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/22.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ScorerRow: View {
    var item: Scorer

    var body: some View {
        Text(item.name)
    }
}

struct ScorerView_Previews: PreviewProvider {
    static var previews: some View {
        ScorerRow(item: Scorer(id: "a", name: "a", url: URL(string: "a")!))
    }
}
