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

    var body: some View {
        NavigationView {
            List(items) { item in
                PlayerRow(name: item.data()["name"] as! String)
            }
            .navigationBarTitle("Players")
        }
    }
}

struct Players_Previews: PreviewProvider {
    static var previews: some View {
        Players()
    }
}
