//
//  RegistrationView.swift
//  M4Exercise
//
//  Created by Erick Rocha on 06.01.25.
//

import SwiftUI

let userDefaultsFirstname = "userDefaultsFirstnameKey"
let userDefaultsLastname = "userDefaultsLastnameKey"
let userDefaultsEmail = "userDefaultsEmailKey"
let userDefaultsIsLoggedIn = "userDefaultsIsLoggedIn"
let userDefaultsPhoneNumber = "userDefaultsPhoneNumber"

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Header(showBackButton: false, showProfilePicture: isLoggedIn)
                Hero()
                
                VStack {
                    InputField(inputField: $firstName, placeholderText: "First name", label: "Name *")
                    InputField(inputField: $lastName, placeholderText: "Last name", label: "Surname *")
                    InputField(inputField: $email, placeholderText: "Email", label: "Email *")
                }.padding()
                
                CustomButton(text: "Register", type: .primary) {
                    if (firstName.isEmpty == false &&
                        lastName.isEmpty == false &&
                        email.isEmpty == false &&
                        isValid(email)) {
                        UserDefaults.standard.set(firstName, forKey: userDefaultsFirstname)
                        UserDefaults.standard.set(lastName, forKey: userDefaultsLastname)
                        UserDefaults.standard.set(email, forKey: userDefaultsEmail)
                        UserDefaults.standard.set(true, forKey: userDefaultsIsLoggedIn)
                        isLoggedIn = true
                    } else {
                            print("error")
                    }
                }.padding()
            }
            .onAppear {
                PersistenceController.shared.clear()
                
                if UserDefaults.standard.bool(forKey: userDefaultsIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    func isValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
    }
}

#Preview {
    Onboarding()
}
