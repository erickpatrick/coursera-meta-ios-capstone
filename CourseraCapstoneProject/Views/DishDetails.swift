//
//  DishDetails.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct DishDetails: View {
    let dish: Dish
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dish.image!)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
            Text("\(dish.title!)")
            Text("\(dish.desc!)")
            Text("$\(dish.desc!)")
        }
    }
}
