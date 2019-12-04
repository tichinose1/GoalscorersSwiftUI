//
//  Scorers.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/03.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Scorers: View {
    private(set) var association: Doc<Association>
    private(set) var competition: Doc<Competition>
    @State private(set) var items: [Doc<Scorer>] = []
    @State private(set) var selectedItem: Doc<Scorer>?

    var body: some View {
        List(items) { item in
            ScorersRow(regionCode: self.association.data.regionCode, competitionName: self.competition.data.name)
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
            association: SampleData.associations[0],
            competition: SampleData.competitions[0],
            items: SampleData.scorers
        )
    }
}
