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
        VStack (alignment: .leading) {
            Header(showBackButton: true, showProfilePicture: true, actOnClick: true)
            
            VStack (alignment: .leading) {
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image.resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                } placeholder: {
                    ProgressView()
                }
                
                HStack {
                    SectionTitle(text: dish.title!)
                    Spacer()
                    Price(value: Double(dish.price!)!)
                }.padding(.vertical)
                
                Description(text: dish.desc!)
            }
            .padding()
            
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @Previewable let dish: Dish = PreviewDish().singleDish()
    DishDetails(dish: dish)
}
