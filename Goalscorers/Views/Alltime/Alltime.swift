//
//  Alltime.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Alltime: View {
    @State private(set) var items: [OverallScorer] = []
    @State private(set) var isSafariViewPresented: Bool = false

    var body: some View {
        NavigationView {
            List(items) { item in
                AlltimeRow(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.isSafariViewPresented = true
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
        Alltime(items: OverallScorer.samples)
    }
}
