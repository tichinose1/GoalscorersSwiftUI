//
//  ScorerView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/22.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import Firebase

struct ScorerView: View {
    var item: QueryDocumentSnapshot!

    var body: some View {
        Text(item.title)
    }
}

private extension QueryDocumentSnapshot {

    var title: String {
        data()["title"] as! String
    }
}

struct ScorerView_Previews: PreviewProvider {
    static var previews: some View {
        ScorerView()
    }
}
