//
//  Scorers.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/03.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Scorers: View {
    private(set) var regionCode: String
    private(set) var competitionName: String
    private(set) var items: [Doc<Scorer>] = []
    @State private(set) var selectedItem: Doc<Scorer>?

    var body: some View {
        List(items) { item in
            ScorersRow(regionCode: self.regionCode, competitionName: self.competitionName)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectedItem = item
                }
                .sheet(item: self.$selectedItem) { item in
                    SafariView(url: item.data.url)
                }
        }
        .navigationBarTitle("Current season")
    }
}

struct Scorers_Previews: PreviewProvider {
    static var previews: some View {
        Scorers(
            regionCode: "WW",
            competitionName: "hoge",
            items: SampleData.scorers
        )
    }
}
