//
//  SectionTitle.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 09.01.25.
//

import SwiftUI

struct SectionTitle: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(Font.custom("Karla", size: 20))
            .fontWeight(.semibold)
            .foregroundStyle(Color.llGrayDark)
    }
}

#Preview {
    SectionTitle(text: "Personal information")
}
