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
                    CustomButton(text: "Starters", type: filter == "starters" ? .filter(true) : .filter(false)) {
                        filter = filter == "starters" ? "" : "starters"
                    }
                    CustomButton(text: "Mains", type: filter == "mains" ? .filter(true) : .filter(false)) {
                        filter = filter == "mains" ? "" : "mains"
                    }
                    CustomButton(text: "Desserts", type: filter == "desserts" ? .filter(true) : .filter(false)) {
                        filter = filter == "desserts" ? "" : "desserts"
                    }
                    CustomButton(text: "Drinks", type: filter == "drinks" ? .filter(true) : .filter(false)) {
                        filter = filter == "drinks" ? "" : "drinks"
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
