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
                
                TextField("First name", text: $firstName)
                TextField("Last name", text: $lastName)
                TextField("Email", text: $email)
                Button {
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
                } label: {
                    Text("Register")
                        .font(Font.custom("Karla", size: 18))
                }
            }
            .padding()
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
