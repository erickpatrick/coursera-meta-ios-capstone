//
//  Price.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 09.01.25.
//

import SwiftUI

struct Price: View {
    let value: Double
    
    var body: some View {
        Text("$" + String(format: "%.2f", value))
            .foregroundStyle(.llGreen)
            .font(Font.custom("Karla", size: 20))
            .fontWeight(.semibold)
    }
}

#Preview {
    Price(value: 10.0)
}
