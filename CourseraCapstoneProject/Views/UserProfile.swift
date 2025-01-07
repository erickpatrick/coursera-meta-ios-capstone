//
//  UserProfile.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct UserProfile: View {
    let firstname = UserDefaults.standard.value(forKey: userDefaultsFirstname)
    let lastname = UserDefaults.standard.value(forKey: userDefaultsLastname)
    let email = UserDefaults.standard.value(forKey: userDefaultsEmail)
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal information.")
            Image("profile-image-placeholder")
            Text("\(firstname ?? "")")
            Text("\(lastname ?? "")")
            Text("\(email ?? "")")
            Button {
                UserDefaults.standard.set(false, forKey: userDefaultsIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text("Logout")
            }
            Spacer()

        }
    }
}

#Preview {
    UserProfile()
}
