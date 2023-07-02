//
//  CustomTabBarView.swift
//  CustomTabView
//
//  Created by Md Shohidur Rahman on 7/1/23.
//

import SwiftUI

struct CustomTabBarView: View {
    
    
    let tabs: [TabBarItem]
    @Binding  var selection: TabBarItem
    
    
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
            
        }
        .padding(6)
        .background(
            Color.white.ignoresSafeArea(edges: .bottom))
        
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.green),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.red),
        TabBarItem(iconName: "person", title: "Profile", color: Color.blue)
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}


extension CustomTabBarView {
    
    func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10,weight: .semibold))
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(selection == tab ? tab.color: Color.gray)
        .padding(.vertical,8)
        .background(selection == tab ? tab.color.opacity(0.2): Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem){
        withAnimation(.easeInOut){
            selection = tab
        }
    }
}


//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}
