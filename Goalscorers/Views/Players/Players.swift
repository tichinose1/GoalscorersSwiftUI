//
//  Players.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import Firebase

struct Players: View {
    @State private var items: [QueryDocumentSnapshot] = []
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isPresented = true }) {
                    PlayerRow(name: item.data()["name"] as! String)
                }
                .sheet(isPresented: self.$isPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("Players")
        }
        .onAppear(perform: self.onAppear)
    }
}

private extension Players {

    func onAppear() {
        Firestore.firestore().collection("players").addSnapshotListener { snapshot, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            guard let snapshot = snapshot else { return }
            self.items = snapshot.documents
        }
    }
}

private extension QueryDocumentSnapshot {

    var url: URL {
        URL(string: data()["url"] as! String)!
    }
}

struct Players_Previews: PreviewProvider {
    static var previews: some View {
        Players()
    }
}
