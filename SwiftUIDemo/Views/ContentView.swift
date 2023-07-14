//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI

typealias AnyDict = [String: Any]

struct ContentView: View {
    @State private var selectedIndex : Int = 1
    var body: some View {
        TabView(selection: $selectedIndex) {
            Home()
                .tabItem({
                    Text("Home")
                    Image(systemName: "house")
                })
                .tag(1)
            Search()
                .tabItem({
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                })
                .tag(2)
            ListView()
                .tabItem({
                    Text("List")
                    Image(systemName: "list.clipboard")
                })
                .tag(3)
            GridView()
                .tabItem({
                    Text("Grid")
                    Image(systemName: "square.grid.2x2")
                })
                .tag(4)
            Profile()
                .tabItem({
                    Text("Profile")
                    Image(systemName: "person.circle")
                })
                .tag(5)
        }.accentColor(.red)
            .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
