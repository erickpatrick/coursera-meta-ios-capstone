//
//  Filters.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 11.01.25.
//

import SwiftUI

struct Filters: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Order for delivery!".uppercased())
                .font(Font.custom("Karla", size: 20))
                .fontWeight(.black)
            ScrollView (.horizontal) {
                HStack (spacing: 20) {
                    CustomButton(text: "Starters", type: .filter) {}
                    CustomButton(text: "Mains", type: .filter) {}
                    CustomButton(text: "Desserts", type: .filter) {}
                    CustomButton(text: "Drinks", type: .filter) {}
                }
            }
        }.padding(.vertical)
    }
}

#Preview {
    Filters()
}
