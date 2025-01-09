//
//  Description.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 09.01.25.
//

import SwiftUI

struct Description: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.llGreen)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(2)
            .font(Font.custom("Karla", size: 16))
    }
}

#Preview {
    Description(text: "Here comes some big text, so let's try seeing if it appears as expected in the preview. Otherwise we have to change it accordingly")
}
