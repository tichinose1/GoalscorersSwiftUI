//
//  ScorerView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/22.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ScorerView: View {
    var name: String

    var body: some View {
        Text(name)
    }
}

struct ScorerView_Previews: PreviewProvider {
    static var previews: some View {
        ScorerView(name: "a")
    }
}
