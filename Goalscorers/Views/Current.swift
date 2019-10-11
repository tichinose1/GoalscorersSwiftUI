//
//  CurrentSeason.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Current: View {
    var items: [Scorer] = []

    var body: some View {
        List(items) { item in
            NavigationLink(destination: Text(item.name)) {
                ScorerRow(scorer: item)
            }
        }
        .navigationBarTitle("Current season")
    }
}

struct ScorerRow: View {
    var scorer: Scorer

    var body: some View {
        Text(scorer.name)
    }
}

struct CurrentSeason_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Current(items: [
                Scorer(id: "1", name: "UEFA Euro 1996", url: URL(string: "https://en.wikipedia.org/wiki/UEFA_Euro_1996#Goalscorers")!)
            ])
        }
    }
}
