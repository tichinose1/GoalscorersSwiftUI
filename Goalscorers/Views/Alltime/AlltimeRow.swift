//
//  AlltimeRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct AlltimeRow: View {
    private(set) var item: OverallScorer
    @State private var competitionName = ""
    @State private var regionCode = "WW"

    var body: some View {
        HStack {
            Image(regionCode)
            Text(competitionName)
            Spacer()
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
                self.competitionName = item.name
                
                item.fetchAssociation { result in
                    switch result {
                    case .failure:
                        break
                    case .success(let item):
                        self.regionCode = item.regionCode
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
