//
//  Current.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Current: View {
    // Previewでいじれるように基本的にすべてのメンバ変数をprivate(set)にする
    @State private(set) var items: [Scorer] = []
    @State private(set) var isSafariViewPresented = false
    @State private(set) var targetURL: URL!

    var body: some View {
        NavigationView {
            List(items) { item in
                CurrentRow(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.isSafariViewPresented = true
                        self.targetURL = item.url // SafariViewがキャッシュされるため？タップ時に（動的に）URLを設定しなおす必要がある
                    }
                    .sheet(isPresented: self.$isSafariViewPresented) {
                        SafariView(url: self.targetURL)
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
