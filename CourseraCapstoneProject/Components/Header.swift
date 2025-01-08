//
//  Header.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct Header: View {
    let showBackButton: Bool?
    let showProfilePicture: Bool?
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    LittleLemonLogo()
                        .frame(height: 35)
                    Spacer()
                }
                HStack {
                    if showProfilePicture ?? false {
                        Spacer()
                        Image("profile-image-placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                            .padding(.horizontal, 25)
                    }
                }
                HStack {
                    if showBackButton ?? false {
                        Button {
                            
                        } label: {
                            Text(Image(systemName: "arrow.left.circle.fill"))
                                .foregroundColor(Color.llGreenDark)
                                .font(.largeTitle)
                                .padding(.horizontal, 25)
                        }

                        Spacer()
                    }
                }
            }
            Hero()
        }
    }
}

#Preview {
    Header(showBackButton: true, showProfilePicture: true)
}
