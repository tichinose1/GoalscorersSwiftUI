//
//  AlltimeRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/23.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct AlltimeRow: View {
    var item: OverallGoalscorers

    @State private var name: String = ""

    var body: some View {
        Text(name)
            .onAppear(perform: self.onAppear)
    }
}

private extension AlltimeRow {

    func onAppear() {
        item.fetchCompetition { result in
            switch result {
            case .failure:
                break
            case .success(let item):
                self.name = item.name
            }
        }
    }
}

struct AlltimeRow_Previews: PreviewProvider {
    static var previews: some View {
        AlltimeRow(item: OverallGoalscorers(id: "a", data: ["name": "hoge"]))
    }
}
