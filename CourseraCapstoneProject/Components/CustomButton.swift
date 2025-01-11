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
    case filter
    
    func getForegroundColor() -> Color {
        switch self {
        case .primary: return Color.white
        case .secondary: return Color.llGrayDark
        case .tertiary: return Color.llGray
        case .filter: return Color.llGreenDark
        }
    }
    
    func getBackgroundColor() -> Color {
        switch self {
        case .primary: return Color.llGreenDark
        case .secondary: return Color.llYellow
        case .tertiary: return Color.white
        case .filter: return Color.llGrayLight
        }
    }
    
    func getLineWidth() -> CGFloat {
        switch self {
        case .filter: return 0
        case .secondary: return 0
        default: return 1
        }
    }
    
    func getCornerRadius() -> CGFloat {
        switch self {
        case .filter: return 12
        default: return 5
        }
    }
    
    func getFontWeigth() -> Font.Weight {
        switch self {
        case .filter: return .bold
        default: return .semibold
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
                .font(Font.custom("Karla", size: 15))
                .fontWeight(type.getFontWeigth())
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(type.getBackgroundColor())
        .foregroundStyle(type.getForegroundColor())
        .cornerRadius(type.getCornerRadius())
        .overlay {
            RoundedRectangle(cornerRadius: type.getCornerRadius())
                .stroke(type.getBackgroundColor(), lineWidth: type.getLineWidth())
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
    CustomButton(text: "Filters", type: .filter, action: {})
        .frame(maxWidth: 150)
}
