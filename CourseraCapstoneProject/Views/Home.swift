//
//  HomeView.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
            TabView {
                Menu()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
                    .tabItem { Label(LocalizedStringKey("Menu"), systemImage: "list.dash") }
                    .toolbar(.hidden, for: .tabBar)
                
                UserProfile()
                    .tabItem {
                        Label(LocalizedStringKey("Profile"), systemImage: "square.and.pencil")
                            .toolbar(.hidden, for: .tabBar)
                    }
            }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
