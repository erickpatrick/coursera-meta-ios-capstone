//
//  InputField.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 08.01.25.
//

import SwiftUI

struct InputField: View {
    @Binding var inputField: String;
    let placeholderText: String;
    let label: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("\(label)")
                .font(Font.custom("Karla", size: 20))
                .foregroundStyle(.llGray)
                .fontWeight(.bold)
            TextField(placeholderText, text: $inputField)
                .padding(.vertical, 12)
                .padding(.horizontal, 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.llGrayLight, lineWidth: 1)
                }
        }.padding(.bottom, 8)
    }
}

#Preview {
    @Previewable @State var inputField = ""
    InputField(inputField: $inputField, placeholderText: "First name", label: "Name")
        .padding()
}
