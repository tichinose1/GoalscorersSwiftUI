//
//  CurrentRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/22.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct CurrentRow: View {
    var item: Goalscorers

    var body: some View {
        Text(item.name)
            .onAppear(perform: self.onAppear)
    }
}

extension CurrentRow {

    func onAppear() {
        item.fetchCompetition { result in
            switch result {
            case .failure:
                break
            case .success:
                break
            }
        }
    }
}

struct ScorerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentRow(item: Goalscorers(id: "a", data: ["title": "hoge"]))
    }
}
