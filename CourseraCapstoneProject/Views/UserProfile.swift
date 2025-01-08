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
    let phoneNumber = UserDefaults.standard.value(forKey: userDefaultsPhoneNumber)
    
    @State var firstnameTextField: String = ""
    @State var lastnameTextField: String = ""
    @State var emailTextField: String = ""
    @State var phoneNumberTextField: String = ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack (alignment: .leading)  {
            Header(showBackButton: true, showProfilePicture: true, actOnClick: false)
        
            ScrollView {
                VStack (alignment: .leading, spacing: 20) {
                    Text("Personal information.")
                        .font(Font.custom("Karla", size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.llGrayDark)
                    
                    VStack (alignment: .leading) {
                        Text("Avatar")
                            .font(Font.custom("Karla", size: 14))
                            .foregroundStyle(.llGrayDark)
                        
                        HStack (spacing: 20) {
                            Image("profile-image-placeholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                
                            CustomButton(text: "Change", type: .primary) {
                                
                            }.frame(width: 100)
                            CustomButton(text: "Remove", type: .tertiary) {
                                
                            }.frame(width: 100)
                            Spacer()
                        }
                    }
                    
                    
                    VStack (alignment: .leading, spacing: 20) {
                        InputField(inputField: $firstnameTextField, placeholderText: "First name", label: "First name", isCompact: true)
                        InputField(inputField: $lastnameTextField, placeholderText: "Last name", label: "Last name", isCompact: true)
                        InputField(inputField: $emailTextField, placeholderText: "Email", label: "Email", isCompact: true)
                        InputField(inputField: $phoneNumberTextField, placeholderText: "Phone number", label: "Phone number", isCompact: true)
                    }
                    
                    Text("Email notifications")
                        .font(Font.custom("Karla", size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.llGrayDark)
                    
                    
                    CustomButton(text: "Logout", type: .secondary) {
                        UserDefaults.standard.set(false, forKey: userDefaultsIsLoggedIn)
                        self.presentation.wrappedValue.dismiss()
                    }
                    
                    HStack (spacing: 20) {
                        CustomButton(text: "Discard changes", type: .tertiary) {
                            
                        }
                        
                        CustomButton(text: "Save changes", type: .primary) {
                            
                        }.frame(width: 140)
                    }
                    .padding(20)
                    Spacer()
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.llGrayLight, lineWidth: 1)
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .onAppear {
            firstnameTextField = String("\(firstname ?? "")")
            lastnameTextField = String("\(lastname ?? "")")
            emailTextField = String("\(email ?? "")")
            phoneNumberTextField = String("\(phoneNumber ?? "")")
        }
    }
}

#Preview {
    UserProfile()
}
