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
    @State private(set) var items: [Doc<Scorer>] = []
    @State private(set) var selectedItem: Doc<Scorer>?

    var body: some View {
        NavigationView {
            List(items) { item in
                ScorerRow(item: item.data)
                    // これをいれないとSpacerがタップに反応しない
                    .contentShape(Rectangle())
                    // セルをButtonにするとImageがロード出来ないため、ジェスチャで対応する
                    .onTapGesture {
                        self.selectedItem = item
                    }
                    // SafariViewがキャッシュされるため？isPresentedではなくitemの方を使う
                    .sheet(item: self.$selectedItem) { item in
                        SafariView(url: item.data.url)
                            .edgesIgnoringSafeArea(.vertical)
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
        fetchLatestScorers { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let items):
                self.items = items
            }
        }
    }
}

struct Current_Previews: PreviewProvider {
    static var previews: some View {
        Current(items: SampleData.scorers)
    }
}
