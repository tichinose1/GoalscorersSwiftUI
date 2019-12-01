//
//  Competitions.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/09.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Competitions: View {
    private(set) var association: Doc<Association>!
    @State private(set) var items: [Doc<Competition>] = []

    var body: some View {
        List(items) { item in
            NavigationLink(destination: Text(item.data.name)) {
                CompetitionsRow(item: item, regionCode: self.association.data.regionCode)
            }
        }
        .onAppear {
            self.onAppear()
        }
        .navigationBarTitle(association.data.name)
    }
}

private extension Competitions {

    func onAppear() {
        fetchCompetitions(associationRef: association.reference!) { result in
            switch result {
            case .failure:
                break
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Competitions_Previews: PreviewProvider {
    static var previews: some View {
        Competitions()
    }
}
