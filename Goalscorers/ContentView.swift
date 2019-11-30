//
//  ContentView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/09.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(){
            Current(items: []).tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Current season")
                }
            }
            Maps().tabItem {
                VStack {
                    Image(systemName: "map")
                    Text("Maps")
                }
            }
            Alltime(items: []).tabItem {
                VStack {
                    Image(systemName: "clock")
                    Text("All-time")
                }
            }
            Players(items: []).tabItem {
                VStack {
                    Image(systemName: "person")
                    Text("Players")
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
