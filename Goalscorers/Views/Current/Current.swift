//
//  Current.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/10.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct Current: View {
    @State private var items: [Goalscorers] = []
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isPresented = true }) {
                    NavigationLink(destination: Text("destination"), isActive: .constant(false)) {
                        CurrentRow(item: item)
                    }
                }
                .sheet(isPresented: self.$isPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("Current season")
        }
        .onAppear { self.onAppear() }
    }
}

private extension Current {

    func onAppear() {
        Goalscorers.fetchLatest { result in
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
        Current()
    }
}
