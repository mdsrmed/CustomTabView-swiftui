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
    @Namespace private var namespace
    
    
    
    var body: some View {
        
        tabBarVersion2()
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .favorites, .profile
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
        
            selection = tab
        
    }
    
    private func tabBarVersion1() -> some View {
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


//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}
extension CustomTabBarView {
    func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10,weight: .semibold))
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(selection == tab ? tab.color: Color.gray)
        .padding(.vertical,8)
        .background(
            ZStack {
                if selection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "bg" , in: namespace)
                }
            })
        .cornerRadius(10)
    }
    
    private func tabBarVersion2() -> some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
            
        }
        .padding(6)
        .background(
            Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10,x: 0, y: 5)
        .padding(.horizontal)
    }
}
