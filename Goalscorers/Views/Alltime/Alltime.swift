//
//  Alltime.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Alltime: View {
    @State private var items: [OverallScorer] = []
    @State private var isSafariViewPresented: Bool = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isSafariViewPresented = true }) {
                    Text(item.id)
                }
                .sheet(isPresented: self.$isSafariViewPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("All-time top scorers")
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension Alltime {

    func onAppear() {
        OverallScorer.fetchAll { result in
            switch result {
            case .failure:
                break
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Alltime_Previews: PreviewProvider {
    static var previews: some View {
        Alltime()
    }
}
