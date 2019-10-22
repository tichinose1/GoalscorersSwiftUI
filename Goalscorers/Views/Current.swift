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
    @State private var isPresented = false

    var body: some View {
        List(items) { item in
            Button(action: { self.isPresented = true }) {
                ScorerView(title: item.title)
            }
            .sheet(isPresented: self.$isPresented) {
                SafariView(url: item.url)
            }
        }
        .navigationBarTitle("Current season")
        .onAppear { self.onAppear() }
    }
}

private extension QueryDocumentSnapshot {

    var title: String {
        data()["title"] as! String
    }

    var url: URL {
        URL(string: data()["url"] as! String)!
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
