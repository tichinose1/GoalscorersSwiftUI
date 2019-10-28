//
//  CurrentSeason.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Current: View {
    @State private var items: [Scorer] = []
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isPresented = true }) {
                    ScorerRow(item: item)
                }
                .sheet(isPresented: self.$isPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("Current season")
        }
        .onAppear { self.onAppear() }
    }
}

private extension Current {

    func onAppear() {
        Scorer.fetchLatest { result in
            switch result {
            case .failure:
                break
            case .success(let scorers):
                self.items = scorers
            }
        }
    }
}

struct CurrentSeason_Previews: PreviewProvider {
    static var previews: some View {
        Current()
    }
}
