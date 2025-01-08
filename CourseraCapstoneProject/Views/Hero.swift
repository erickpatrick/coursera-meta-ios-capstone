//
//  Hero.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct Hero: View {
    @State var search: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: -16) {
            Text("Little Lemon")
                .font(Font.custom("Markazi Text", size: 64))
                .fontWeight(.bold)
                .foregroundStyle(Color.llYellow)
            HStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    Text("Chicago")
                        .font(Font.custom("Markazi Text", size: 40))
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 4)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(Font.custom("Karla", size: 18))
                        .foregroundStyle(Color.white)
                }
                
                Spacer()
                
                
                Image("hero")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 135, height: 135)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
            }
        }
        .padding()
        .background(Color.llGreenDark)
    }
}

#Preview {
    Hero()
}
