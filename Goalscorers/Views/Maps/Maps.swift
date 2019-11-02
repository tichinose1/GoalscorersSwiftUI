//
//  Maps.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Maps: View {
    @State private var items: [Association] = []
    @State private var selection: Int? = nil

    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("hoge"), tag: 1, selection: .constant(nil)) {
                MapView(associations: $items)
                    .edgesIgnoringSafeArea(.vertical)
            }
        }
        .onAppear(perform: self.onAppear)
    }
}

private extension Maps {

    func onAppear() {
        Association.fetchAll { result in
            switch result {
            case .failure:
                break
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Maps_Previews: PreviewProvider {
    static var previews: some View {
        Maps()
    }
}
