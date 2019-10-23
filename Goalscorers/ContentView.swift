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
                Current()
            }
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Current season")
                }
            }
            .tag(0)
            Maps().tabItem {
                VStack {
                    Image(systemName: "map")
                    Text("Maps")
                }
            }
            .tag(1)
            Overall().tabItem {
                VStack {
                    Image(systemName: "clock")
                    Text("All-time")
                }
            }.tag(2)
            NavigationView {
                Players()
            }
            .tabItem {
                VStack {
                    Image(systemName: "person")
                    Text("Players")
                }
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
