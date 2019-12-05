//
//  PlayerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/29.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct PlayerRow: View {
    private(set) var item: Player
    @State private(set) var regionCode: String?

    var body: some View {
        HStack {
            Image(regionCode ?? "WW")
            Text(item.name)
            Spacer()
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension PlayerRow {

    func onAppear() {
        item.associationRef?.fetch { (result: Result<Doc<Association>, GoalscorersError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let item):
                self.regionCode = item.data.regionCode
            }
        }
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(
            item: Player.samples[0]
        )
    }
}
