//
//  ContentView.swift
//  CustomTabView
//
//  Created by Md Shohidur Rahman on 7/1/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: Color.green)
    
    var body: some View {
       
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: Color.green), selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: Color.red), selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: Color.blue ), selection: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.green),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.red),
        TabBarItem(iconName: "person", title: "Profile", color: Color.blue)
    ]
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
