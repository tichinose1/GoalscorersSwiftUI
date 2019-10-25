//
//  Maps.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import Firebase

struct Maps: View {
    @State private var items: [QueryDocumentSnapshot] = []

    var body: some View {
        MapView(associations: $items)
            .edgesIgnoringSafeArea(.vertical)
            .onAppear(perform: self.onAppear)
    }
}

private extension Maps {

    func onAppear() {
        Firestore.firestore().collection("associations").addSnapshotListener { snapshot, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            guard let snapshot = snapshot else { return }
            self.items = snapshot.documents
        }
    }
}

struct Maps_Previews: PreviewProvider {
    static var previews: some View {
        Maps()
    }
}
