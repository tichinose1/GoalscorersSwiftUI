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
//        List(items) { item in
//            NavigationLink(destination: SafariView(url: item.url)) {
//                ScorerRow(scorer: item)
//            }
//        }
        List(items, id: \.documentID) { item in
            Text("")
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
                print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
                // TODO: エラー処理
                guard let documents = snapshot?.documents else { return }
                self.items = documents.sorted {
                    ($0["order"] as! Int) > ($1["order"] as! Int)
                }
        }
    }
}

struct ScorerRow: View {
    var scorer: Scorer

    var body: some View {
        Text(scorer.name)
    }
}

struct CurrentSeason_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Current()
        }
    }
}
