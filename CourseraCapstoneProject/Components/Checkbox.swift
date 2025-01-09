//
//  Checkbox.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 09.01.25.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isOn: Bool
    let text: String
    
    var body: some View {
        HStack {
            Button {
                isOn.toggle()
            } label: {
                Image(systemName: isOn ? "checkmark.square.fill" : "square.fill")
                    .foregroundStyle(Color.llGreenDark)
                    .font(.system(size: 22))
                
                Text(text)
                    .font(Font.custom("Karla", size: 16))
                    .foregroundStyle(.llGrayDark)
            }
        }

    }
}

#Preview {
    @Previewable @State var isOn: Bool = false
    Checkbox(isOn: $isOn, text: "Hello")
}
