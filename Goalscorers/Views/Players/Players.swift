//
//  Players.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Players: View {
    @State private var items: [Player] = []
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isPresented = true }) {
                    Text(item.name)
                }
                .sheet(isPresented: self.$isPresented) {
                    SafariView(url: item.url)
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
        Player.fetchAll { result in
            switch result {
            case .failure:
                break
            case .success(let players):
                self.items = players
            }
        }
    }
}

struct Players_Previews: PreviewProvider {
    static var previews: some View {
        Players()
    }
}
