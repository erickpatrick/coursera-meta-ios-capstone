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
    var isCompact: Bool = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("\(label)")
                .font(Font.custom("Karla", size: isCompact ? 12 : 20))
                .foregroundStyle(.llGrayDark)
                .fontWeight(isCompact ? .semibold : .bold)
            TextField("", text: $inputField, prompt: Text(placeholderText).foregroundStyle(.llGrayDark))
                .font(Font.custom("Karla", size: isCompact ? 14 : 16))
                .foregroundStyle(.llGrayDark)
                .padding(.vertical, 12)
                .padding(.horizontal, isCompact ? 8 : 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.llGray, lineWidth: 1)
                }
        }.padding(.bottom, 8)
    }
}

#Preview {
    @Previewable @State var inputField = ""
    InputField(inputField: $inputField, placeholderText: "First name", label: "Name", isCompact: true)
        .padding()
}
