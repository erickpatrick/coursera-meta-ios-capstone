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
                        Text(dish.desc! + "\n")
                            .foregroundStyle(.llGreen)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(2)
                            .font(Font.custom("Karla", size: 16))
                        
                        Text("$" + String(format: "%.2f", Double(dish.price!)!))
                            .foregroundStyle(.llGreen)
                            .font(Font.custom("Karla", size: 20))
                            .fontWeight(.semibold)
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
