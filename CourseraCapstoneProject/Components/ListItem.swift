//
//  ListItem.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 09.01.25.
//

import SwiftUI

struct ListItem: View {
    let dish: Dish
    
    var body: some View {
        ZStack {
            HStack {
                Text("\(dish.title!) - \(dish.price!)")
                Spacer()
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            }
            NavigationLink(destination: DishDetails(dish: dish)) {
                EmptyView()
            }.opacity(0)
        }.padding(.vertical, 16)
    }
}

#Preview {
    @Previewable let dish: Dish = PreviewDish().singleDish()
    ListItem(dish: dish)
}
