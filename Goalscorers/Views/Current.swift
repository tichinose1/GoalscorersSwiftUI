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
    @State private var items: [QueryDocumentSnapshot] = []
    @State private var showSheet = false

    var body: some View {
        List(items) { item in
            Button(action: { self.showSheet = true }) {
                ScorerView(item: item)
            }
            .sheet(isPresented: self.$showSheet) {
                SafariView(url: URL(string: (item.data()["url"] as! String))!)
            }
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
