//
//  CurrentSeason.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct CurrentSeason: View {
    var body: some View {
        List {
            ForEach(Range(1...20)) { _ in
                Text("a")
            }
        }
        .navigationBarTitle("Current season")
    }
}

struct CurrentSeason_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSeason()
    }
}
