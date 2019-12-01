//
//  CurrentRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/27.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct CurrentRow: View {
    private(set) var item: Scorer
    @State private var regionCode = "WW"

    var body: some View {
        HStack {
            Image(regionCode)
            Text(item.title)
            Spacer()
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

struct CurrentRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrentRow(item: Scorer.sample)
    }
}
