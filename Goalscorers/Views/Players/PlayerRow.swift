//
//  PlayerRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/29.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct PlayerRow: View {
    var item: Player
    @State private var association: Association?

    var body: some View {
        HStack {
            Text(association?.regionCode ?? "")
            Text(item.name)
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension PlayerRow {

    func onAppear() {
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

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(item: Player.sample)
    }
}
