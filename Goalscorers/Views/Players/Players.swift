//
//  Players.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Players: View {
    @State private(set) var items: [Doc<Player>] = []
    @State private(set) var selectedItem: Doc<Player>?

    var body: some View {
        NavigationView {
            List(items) { item in
                PlayersRow(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedItem = item
                    }
                    .sheet(item: self.$selectedItem) { item in
                        SafariView(url: item.data.url)
                    }
            }
            .navigationBarTitle("Players")
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension Players {

    func onAppear() {
        fetchAllPlayers { result in
            switch result {
            case .failure:
                break
            case .success(let players):
                self.items = players
            }
        }
    }
}

//struct Players_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Players(items: Player.samples)
//        }
//    }
//}
