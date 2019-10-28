//
//  Alltime.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import Firebase

struct Alltime: View {
    @State private var items: [QueryDocumentSnapshot] = []
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isPresented = true }) {
                    AlltimeRow(competitionRef: item.competitionRef)
                }
                .sheet(isPresented: self.$isPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("All-time top scorers")
        }
        .onAppear(perform: self.onAppear)
    }
}

private extension Alltime {

    func onAppear() {
        Firestore.firestore().collection("overall_scorers").addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            guard let snapshot = snapshot else { return }
            self.items = snapshot.documents
        }
    }
}

private extension QueryDocumentSnapshot {

    var competitionRef: DocumentReference {
        data()["competition_ref"] as! DocumentReference
    }

    var url: URL {
        URL(string: data()["url"] as! String)!
    }
}

struct Alltime_Previews: PreviewProvider {
    static var previews: some View {
        Alltime()
    }
}
