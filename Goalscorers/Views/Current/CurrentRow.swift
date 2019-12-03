//
//  CurrentRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct CurrentRow: View {
    private(set) var item: Doc<Scorer>
    @State private(set) var regionCode = "WW"

    var body: some View {
        HStack {
            Image(regionCode)
            Text(item.data.title)
            Spacer()
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension CurrentRow {

    func onAppear() {
        item.data.competitionRef?.fetch { (result: Result<Doc<Competition>, GoalscorersError>) in
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

struct CurrentRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrentRow(item: SampleData.scorer)
    }
}
