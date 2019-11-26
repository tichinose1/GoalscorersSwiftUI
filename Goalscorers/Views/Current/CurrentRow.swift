//
//  CurrentRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct CurrentRow: View {
    var item: Scorer
    @State private var competition: Competition?

    var body: some View {
        VStack {
            Text(item.title)
            Text(competition?.name ?? "")
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension CurrentRow {

    func onAppear() {
        item.fetchCompetition { result in
            switch result {
            case .failure:
                break
            case .success(let item):
                self.competition = item
            }
        }
    }
}

struct CurrentRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrentRow(item: Scorer.sample)
    }
}
