//
//  PlayersRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/29.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct PlayersRow: View {
    private(set) var item: Doc<Player>
    @State private(set) var regionCode = "WW"

    var body: some View {
        HStack {
            Image(regionCode)
            Text(item.data.name)
            Spacer()
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension PlayersRow {

    func onAppear() {
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

//struct PlayersRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayersRow(
//            item: Player.sample,
//            regionCode: "PT"
//        )
//    }
//}
