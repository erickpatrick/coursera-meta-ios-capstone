//
//  Menu.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            List {
                EmptyView()
            }
        }.padding()
    }
}

#Preview {
    Menu()
}
