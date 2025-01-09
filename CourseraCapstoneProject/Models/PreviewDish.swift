//
//  PrewviewDish.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 09.01.25.
//

import SwiftUI

struct PreviewDish {
    @Environment(\.managedObjectContext) var viewContext
    
    func singleDish() -> Dish {
        let dish: Dish = Dish(context: viewContext)
        dish.title = "Test Title"
        dish.desc = "Test Description"
        dish.category = "Test Category"
        dish.price = "100"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        
        return dish
    }
}
