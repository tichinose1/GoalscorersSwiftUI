//
//  ScorerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ScorerRow: View {
    private(set) var item: Scorer
    @State private(set) var regionCode: String?

    var body: some View {
        HStack {
            Image(regionCode ?? "WW")
            Text(item.title)
            Spacer()
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension ScorerRow {

    func onAppear() {
        // イニシャライザでregionCodeを渡された場合は取りに行かない
        if let _ = regionCode { return }
        item.competitionRef?.fetch { (result: Result<Doc<Competition>, GoalscorersError>) in
            switch result {
            case .failure:
                break
            case .success(let item):
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

struct ScorerRow_Previews: PreviewProvider {
    static var previews: some View {
        ScorerRow(item: Scorer.samples[0])
    }
}
