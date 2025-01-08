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
    var actOnClick: Bool = false
    
    @State var shouldNavigateToProfile: Bool = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            NavigationLink(destination: UserProfile(), isActive: $shouldNavigateToProfile) {
                EmptyView()
            }
            
            ZStack {
                HStack {
                    Spacer()
                    LittleLemonLogo()
                        .frame(height: 35)
                    Spacer()
                }
                HStack {
                    if showProfilePicture ?? false {
                        Button {
                            if actOnClick {
                                shouldNavigateToProfile = true
                            }
                        } label: {
                            Spacer()
                            Image("profile-image-placeholder")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                                .padding(.horizontal, 25)
                        }

                    }
                }
                HStack {
                    if showBackButton ?? false {
                        Button {
                            self.presentation.wrappedValue.dismiss()
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
        }.padding(.bottom, 16)
    }
}

#Preview {
    Header(showBackButton: true, showProfilePicture: true)
}
