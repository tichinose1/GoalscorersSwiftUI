//
//  Competitions.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/09.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Competitions: View {
    private(set) var association: Association!
    @State private(set) var items: [Competition] = []

    var body: some View {
        List(items) { item in
            NavigationLink(destination: Text(item.name)) {
                CompetitionsRow(item: item, regionCode: self.association.regionCode)
            }
        }
        .onAppear {
            self.onAppear()
        }
        .navigationBarTitle(association.name)
    }
}

private extension Competitions {

    func onAppear() {
        association.fetchCompetitions { result in
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
