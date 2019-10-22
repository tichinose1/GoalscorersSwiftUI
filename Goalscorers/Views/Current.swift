//
//  CurrentSeason.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import Firebase

struct Current: View {
    @State var items: [QueryDocumentSnapshot] = []

    var body: some View {
        List(items) { item in
            ScorerView(item: item)
        }
        .navigationBarTitle("Current season")
        .onAppear { self.onAppear() }
    }
}

private extension Current {

    func onAppear() {
        Firestore
            .firestore()
            .collection("scorers")
            .whereField("season", isGreaterThan: "2018")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                guard let snapshot = snapshot else { return }
                self.items = snapshot.documents
        }
    }
}

struct CurrentSeason_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Current()
        }
    }
}
