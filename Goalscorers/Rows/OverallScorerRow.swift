//
//  OverallScorerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/28.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct OverallScorerRow: View {
    private(set) var item: OverallScorer
    @State private(set) var competitionName = ""
    @State private(set) var regionCode = "WW"

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

private extension OverallScorerRow {

    func onAppear() {
        print("item.url: \(item.url)")
        item.competitionRef?.fetch { (result: Result<Doc<Competition>, GoalscorersError>) in
            switch result {
            case .failure:
                break
            case .success(let item):
                self.competitionName = item.data.name
                
                item.data.associationRef?.fetch { (result: Result<Doc<Association>, GoalscorersError>) in
                    switch result {
                    case .failure:
                        break
                    case .success(let item):
                        self.regionCode = item.data.regionCode
                    }
                }
            }
        }
    }
}

struct OverallScorerRow_Previews: PreviewProvider {
    static var previews: some View {
        OverallScorerRow(
            item: OverallScorer.samples[0],
            competitionName: "インターハイ",
            regionCode: "JP"
        )
    }
}
