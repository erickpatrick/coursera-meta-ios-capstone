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
            VStack (alignment: .leading, spacing: 0) {
                Text("\(dish.title!)")
                    .font(Font.custom("Karla", size: 20))
                    .fontWeight(.bold)
                    .foregroundStyle(.llGrayDark)
                
                HStack(alignment: .bottom) {
                    VStack (alignment: .leading, spacing: 20) {
                        Description(text: dish.desc!)
                        
                        Price(value: Double(dish.price!)!)
                    }
                    
                    Spacer()
                    
                    AsyncImage(url: URL(string: dish.image!)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 85, height: 85)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 85, height: 85)
                }
                NavigationLink(destination: DishDetails(dish: dish)) {
                    EmptyView()
                }.opacity(0)
            }.padding(.top, 16)
        }
    }
}

#Preview {
    @Previewable let dish: Dish = PreviewDish().singleDish()
    ListItem(dish: dish)
}
