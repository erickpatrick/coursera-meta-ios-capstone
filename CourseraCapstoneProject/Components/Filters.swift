//
//  Filters.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 11.01.25.
//

import SwiftUI

struct Filters: View {
    @Binding var filter: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Order for delivery!".uppercased())
                .font(Font.custom("Karla", size: 20))
                .fontWeight(.black)
            ScrollView (.horizontal) {
                HStack (spacing: 20) {
                    CustomButton(text: "Starters", type: .filter) {
                        filter = filter == "starters" ? "" : "starters"
                        print(filter.isEmpty ? "empty" : filter)
                    }
                    CustomButton(text: "Mains", type: .filter) {
                        filter = filter == "mains" ? "" : "mains"
                        print(filter.isEmpty ? "empty" : filter)
                    }
                    CustomButton(text: "Desserts", type: .filter) {
                        filter = filter == "desserts" ? "" : "desserts"
                        print(filter.isEmpty ? "empty" : filter)
                    }
                    CustomButton(text: "Drinks", type: .filter) {
                        filter = filter == "drinks" ? "" : "drinks"
                        print(filter.isEmpty ? "empty" : filter)
                    }
                }
            }
        }.padding(.vertical)
    }
}

#Preview {
    @Previewable @State var filter: String = ""
    Filters(filter: $filter)
}
