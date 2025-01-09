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
    @Previewable let dish: Dish = previewDish()
    ListItem(dish: dish)
}

func previewDish() -> Dish {
    @Environment(\.managedObjectContext) var viewContext
    let dish: Dish = Dish(context: viewContext)
    dish.title = "Test Title"
    dish.desc = "Test Description"
    dish.category = "Test Category"
    dish.price = "100"
    dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
    
    return dish
}
