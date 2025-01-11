//
//  UserProfile.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI

struct UserProfile: View {
    @State var firstnameTextField: String = UserDefaults.standard.string(forKey: userDefaultsFirstname) ?? ""
    @State var lastnameTextField: String = UserDefaults.standard.string(forKey: userDefaultsLastname) ?? ""
    @State var emailTextField: String = UserDefaults.standard.string(forKey: userDefaultsEmail) ?? ""
    @State var phoneNumberTextField: String = UserDefaults.standard.string(forKey: userDefaultsPhoneNumber) ?? ""
    
    @State var orderStatus = UserDefaults.standard.bool(forKey: userDefaultsOrderStatus)
    @State var passwordChanges = UserDefaults.standard.bool(forKey: userDefaultsPasswordChanges)
    @State var specialOffers = UserDefaults.standard.bool(forKey: userDefaultsSpecialOffers)
    @State var newsletters = UserDefaults.standard.bool(forKey: userDefaultsNewsletter)
    
    @State var gotSavedSuccessfully: Bool = false
    @State var gotDiscarded: Bool = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack (alignment: .leading)  {
            Header(showBackButton: true, showProfilePicture: true, actOnClick: false)
        
            ScrollView {
                VStack (alignment: .leading, spacing: 20) {
                    SectionTitle(text: "Personal information")
                    
                    // MARK: avatar
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
                                // TODO change image
                            }.frame(width: 100)
                            CustomButton(text: "Remove", type: .tertiary) {
                                // TODO remove image
                            }.frame(width: 100)
                            Spacer()
                        }
                    }
                    
                    // MARK: PErsonal Information
                    VStack (alignment: .leading, spacing: 20) {
                        InputField(inputField: $firstnameTextField, placeholderText: "First name", label: "First name", isCompact: true)
                        InputField(inputField: $lastnameTextField, placeholderText: "Last name", label: "Last name", isCompact: true)
                        InputField(inputField: $emailTextField, placeholderText: "Email", label: "Email", isCompact: true)
                        InputField(inputField: $phoneNumberTextField, placeholderText: "Phone number", label: "Phone number", isCompact: true)
                    }
                    
                    // MARK: Email notifications
                    SectionTitle(text: "Email notifications")
                    
                    VStack (alignment: .leading, spacing: 20) {
                        Checkbox(isOn: $orderStatus, text: "Order statuses")
                        Checkbox(isOn: $passwordChanges,text: "Password changes")
                        Checkbox(isOn: $specialOffers, text: "Special offers")
                        Checkbox(isOn: $newsletters, text: "Newsletter")
                    }
                    
                    // MARK: Buttons
                    CustomButton(text: "Logout", type: .secondary) {
                        onLogoutButtonPress()
                    }
                    
                    HStack (spacing: 20) {
                        CustomButton(text: "Discard changes", type: .tertiary) {
                            onDiscardChangesButtonPress()
                        }
                        CustomButton(text: "Save changes", type: .primary) {
                            onSaveChangesButtonPress()
                        }.frame(width: 140)
                    }.padding(20)
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
        .alert("Saved!", isPresented: $gotSavedSuccessfully) {
            Button(role: .cancel) {
                gotSavedSuccessfully.toggle()
            } label: {
                Text("OK")
            }
        }
        .alert("Discarded!", isPresented: $gotSavedSuccessfully) {
            Button(role: .cancel) {
                gotDiscarded.toggle()
            } label: {
                Text("OK")
            }
        }
    }
    
    func onLogoutButtonPress() {
        UserDefaults.standard.set("", forKey: userDefaultsFirstname)
        UserDefaults.standard.set("", forKey: userDefaultsLastname)
        UserDefaults.standard.set("", forKey: userDefaultsEmail)
        UserDefaults.standard.set("", forKey: userDefaultsPhoneNumber)
        
        UserDefaults.standard.set(false, forKey: userDefaultsOrderStatus)
        UserDefaults.standard.set(false, forKey: userDefaultsPasswordChanges)
        UserDefaults.standard.set(false, forKey: userDefaultsSpecialOffers)
        UserDefaults.standard.set(false, forKey: userDefaultsNewsletter)
        
        UserDefaults.standard.set(false, forKey: userDefaultsIsLoggedIn)
        self.presentation.wrappedValue.dismiss()
    }
    
    func onSaveChangesButtonPress() {
        UserDefaults.standard.set(firstnameTextField, forKey: userDefaultsFirstname)
        UserDefaults.standard.set(lastnameTextField, forKey: userDefaultsLastname)
        UserDefaults.standard.set(emailTextField, forKey: userDefaultsEmail)
        UserDefaults.standard.set(phoneNumberTextField, forKey: userDefaultsPhoneNumber)
        
        UserDefaults.standard.set(orderStatus, forKey: userDefaultsOrderStatus)
        UserDefaults.standard.set(passwordChanges, forKey: userDefaultsPasswordChanges)
        UserDefaults.standard.set(specialOffers, forKey: userDefaultsSpecialOffers)
        UserDefaults.standard.set(newsletters, forKey: userDefaultsNewsletter)
        
        gotSavedSuccessfully.toggle()
    }
    
    func onDiscardChangesButtonPress() {
        firstnameTextField = UserDefaults.standard.string(forKey: userDefaultsFirstname) ?? ""
        lastnameTextField = UserDefaults.standard.string(forKey: userDefaultsLastname) ?? ""
        emailTextField = UserDefaults.standard.string(forKey: userDefaultsEmail) ?? ""
        phoneNumberTextField = UserDefaults.standard.string(forKey: userDefaultsPhoneNumber) ?? ""
        
        orderStatus = UserDefaults.standard.bool(forKey: userDefaultsOrderStatus)
        passwordChanges = UserDefaults.standard.bool(forKey: userDefaultsPasswordChanges)
        specialOffers = UserDefaults.standard.bool(forKey: userDefaultsSpecialOffers)
        newsletters = UserDefaults.standard.bool(forKey: userDefaultsNewsletter)
        
        gotDiscarded.toggle()
    }
}

#Preview {
    UserProfile()
}
