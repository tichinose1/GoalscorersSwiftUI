//
//  Current.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Current: View {
    @State var items: [Scorer]
    @State private var isSafariViewPresented = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isSafariViewPresented = true }) {
                    CurrentRow(item: item)
                }
                .sheet(isPresented: self.$isSafariViewPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("Current season")
        }
        .onAppear {
            self.onAppear()
        }
    }
}

private extension Current {

    func onAppear() {
        Scorer.fetchLatest { result in
            switch result {
            case .failure:
                break
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Current_Previews: PreviewProvider {
    static var previews: some View {
        Current(items: Scorer.samples)
    }
}
