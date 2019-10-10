//
//  ContentView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/09.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                CurrentSeason()
            }
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Current season")
                }
            }
            .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
