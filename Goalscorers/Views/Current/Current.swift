//
//  Current.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Current: View {
    @State private(set) var items: [Scorer] = []
    @State private var isSafariViewPresented = false

    var body: some View {
        NavigationView {
            List(items) { item in
                CurrentRow(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.isSafariViewPresented = true
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
