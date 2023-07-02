//
//  ContentView.swift
//  CustomTabView
//
//  Created by Md Shohidur Rahman on 7/1/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
       
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.green
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    
    private func defaultTabView() -> some View {
        TabView(selection: $selection) {
            Color.green
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                    
            Color.red
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                                    
                                    
        }
    }
    
}
