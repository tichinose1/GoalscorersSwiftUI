//
//  Scorers.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/03.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Scorers: View {
    private(set) var association: Doc<Association>
    private(set) var competition: Doc<Competition>
    @State private(set) var items: [Doc<Scorer>] = []
    @State private(set) var selectedItem: Doc<Scorer>?

    var body: some View {
        List(items) { item in
            ScorerRow(item: item.data, regionCode: self.association.data.regionCode)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectedItem = item
                }
                .sheet(item: self.$selectedItem) { item in
                    SafariView(url: item.data.url)
                        .edgesIgnoringSafeArea(.vertical)
                }
        }
        .navigationBarTitle(competition.data.name)
        .onAppear {
            self.onAppear()
        }
    }
}

private extension Scorers {
    func onAppear() {
        guard let ref = competition.reference else { return }
        fetchScorers(competitionRef: ref) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Scorers_Previews: PreviewProvider {
    static var previews: some View {
        Scorers(
            association: SampleData.associations[0],
            competition: SampleData.competitions[0],
            items: SampleData.scorers
        )
    }
}
