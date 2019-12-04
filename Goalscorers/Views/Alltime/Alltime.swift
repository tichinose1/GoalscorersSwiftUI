//
//  Alltime.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Alltime: View {
    @State private(set) var items: [Doc<OverallScorer>] = []
    @State private(set) var selectedItem: Doc<OverallScorer>?

    var body: some View {
        NavigationView {
            List(items) { item in
                OverallScorerRow(item: item.data)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedItem = item
                    }
                    .sheet(item: self.$selectedItem) { item in
                        SafariView(url: item.data.url)
                            .edgesIgnoringSafeArea(.vertical)
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
        fetchAllOverallScorers { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Alltime_Previews: PreviewProvider {
    static var previews: some View {
        Alltime(items: SampleData.overallScorers)
    }
}
