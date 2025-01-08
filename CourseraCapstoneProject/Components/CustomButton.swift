//
//  CustomButton.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 08.01.25.
//

import SwiftUI

enum CustomButtomType {
    case primary
    case secondary
    case tertiary
    
    func getForegroundColor() -> Color {
        switch self {
        case .primary: return Color.white
        case .secondary: return Color.llGrayDark
        case .tertiary: return Color.llGray
        }
    }
    
    func getBackgroundColor() -> Color {
        switch self {
        case .primary: return Color.llGreenDark
        case .secondary: return Color.llYellow
        case .tertiary: return Color.white
        }
    }
}

struct CustomButton: View {
    let text: String
    let type: CustomButtomType
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("\(text)")
                .frame(maxWidth: .infinity)
                .font(Font.custom("Karla", size: 18))
                .fontWeight(.semibold)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(type.getBackgroundColor())
        .foregroundStyle(type.getForegroundColor())
        .cornerRadius(5)
        .overlay {
            if (type == .tertiary) {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.llGreen, lineWidth: 1)
            }
        }
    }
}

#Preview {
    CustomButton(text: "Log out", type: .secondary, action: {})
        .frame(maxWidth: 150)
    CustomButton(text: "Save changes", type: .primary, action: {})
        .frame(maxWidth: 150)
    CustomButton(text: "Discard changes", type: .tertiary, action: {})
        .frame(maxWidth: 150)
}
