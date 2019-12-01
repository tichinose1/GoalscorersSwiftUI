//
//  Maps.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Maps: View {
    @EnvironmentObject private var store: Store
    @State private(set) var items: [Doc<Association>] = []
    private var selectedAssociation: Doc<Association> {
        items.first { $0.id == store.selectedAssociationID }
            ?? Doc<Association>(
                documentID: "1",
                reference: nil,
                data: Association.sample
            )
    }

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: Competitions(association: selectedAssociation), isActive: $store.isAssociationSelected) {
                    EmptyView()
                }
                MapView(associations: $items)
                    .edgesIgnoringSafeArea(.vertical)
            }
        }
        .onAppear(perform: self.onAppear)
        .onDisappear { self.store.selectAssociation(id: nil) }
    }
}

private extension Maps {

    func onAppear() {
        fetchAllAssociations { result in
            switch result {
            case .failure:
                break
            case .success(let items):
                self.items = items
            }
        }
    }
}

//struct Maps_Previews: PreviewProvider {
//    static var previews: some View {
//        Maps()
//    }
//}
