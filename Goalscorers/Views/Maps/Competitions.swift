//
//  Competitions.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/09.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Competitions: View {
    private(set) var association: Doc<Association>
    @State private(set) var items: [Doc<Competition>] = []

    var body: some View {
        List(items) { item in
            NavigationLink(
                destination: Scorers(association: self.association, competition: item)
            ) {
                CompetitionRow(item: item.data, regionCode: self.association.data.regionCode)
            }
        }
        .navigationBarTitle(association.data.name)
        .onAppear {
            self.onAppear()
        }
    }
}

private extension Competitions {
    func onAppear() {
        fetchCompetitions(associationRef: association.reference!) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Competitions_Previews: PreviewProvider {
    static var previews: some View {
        Competitions(
            association: SampleData.associations[0],
            items: SampleData.competitions
        )
    }
}
