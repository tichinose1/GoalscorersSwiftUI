//
//  AlltimeRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct AlltimeRow: View {
    var item: OverallScorer
    @State private var competition: Competition?
    @State private var association: Association?

    var body: some View {
        HStack {
            Text(association?.regionCode ?? "")
            Text(competition?.name ?? "")
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension AlltimeRow {

    func onAppear() {
        item.fetchCompetition { result in
            switch result {
            case .failure:
                break
            case .success(let item):
                self.competition = item
                
                item.fetchAssociation { result in
                    switch result {
                    case .failure:
                        break
                    case .success(let item):
                        self.association = item
                    }
                }
            }
        }
    }
}

struct AlltimeRow_Previews: PreviewProvider {
    static var previews: some View {
        AlltimeRow(item: OverallScorer.sample)
    }
}
