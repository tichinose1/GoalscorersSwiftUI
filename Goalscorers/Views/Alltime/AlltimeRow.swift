//
//  AlltimeRow.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/23.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import Firebase

struct AlltimeRow: View {
    var competitionRef: DocumentReference!

    @State private var name: String = ""

    var body: some View {
        Text(name)
            .onAppear(perform: self.onAppear)
    }
}

private extension AlltimeRow {

    func onAppear() {
        competitionRef.getDocument { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            guard let snapshot = snapshot else { return }
            self.name = snapshot.name
        }
    }
}

private extension DocumentSnapshot {

    var name: String {
        data()!["name"] as! String
    }
}

struct AlltimeRow_Previews: PreviewProvider {
    static var previews: some View {
        AlltimeRow()
    }
}
