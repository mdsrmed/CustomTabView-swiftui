//
//  TabBarItem.swift
//  CustomTabView
//
//  Created by Md Shohidur Rahman on 7/2/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, favorites, profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favories"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.green
        case .favorites: return Color.red
        case .profile: return Color.blue
        }
    }
    
    
    
    
    
    
}
