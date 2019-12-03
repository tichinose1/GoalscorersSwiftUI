//
//  ScorersRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/03.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ScorersRow: View {
    private(set) var regionCode: String
    private(set) var competitionName: String

    var body: some View {
        HStack {
            Image(regionCode)
            Text(competitionName)
            Spacer()
        }
    }
}

struct ScorersRow_Previews: PreviewProvider {
    static var previews: some View {
        ScorersRow(regionCode: "WW", competitionName: "hoge")
    }
}
