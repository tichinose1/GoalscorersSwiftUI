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
    // 取得できない場合もあるので普通のOptionalにする
    @State private var association: Association?

    var body: some View {
        HStack {
            Text(association?.regionCode ?? "")
            Text(item.title)
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
                        self.association = item
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
