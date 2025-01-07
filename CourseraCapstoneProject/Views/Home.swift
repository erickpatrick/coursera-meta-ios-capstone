//
//  HomeView.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem { Label(LocalizedStringKey("Menu"), systemImage: "list.dash") }
            UserProfile()
                .tabItem {
                    Label(LocalizedStringKey("Profile"), systemImage: "square.and.pencil")
                }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
