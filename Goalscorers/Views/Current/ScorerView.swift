//
//  ScorerView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/22.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ScorerView: View {
    var title: String

    var body: some View {
        Text(title)
    }
}

struct ScorerView_Previews: PreviewProvider {
    static var previews: some View {
        ScorerView(title: "a")
    }
}
