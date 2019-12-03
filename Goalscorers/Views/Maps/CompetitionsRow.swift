//
//  CompetitionsRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/01.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct CompetitionsRow: View {
    private(set) var item: Doc<Competition>
    @State private(set) var regionCode: String

    var body: some View {
        HStack {
            Image(regionCode)
            Text(item.data.name)
            Spacer()
        }
    }
}

struct CompetitionsRow_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsRow(item: SampleData.competitions[0], regionCode: "WW")
    }
}
