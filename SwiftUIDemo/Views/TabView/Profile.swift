//
//  Profile.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct Profile: View {
    @State private var shouldShowLogOutOptions = false
    @StateObject private var viewModel = UserViewModel()
    @EnvironmentObject var sessionManager : SessionManager
    
    var body: some View {
        NavigationStack{
            Form {
                if let user = viewModel.user {
                    Section{
                        HStack{
                            Spacer()
                            let imgUrl = URL(string: user.profilePic ?? "")
                            WebImage(url: imgUrl)
                                .resizable()
                                .placeholder(content: {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 150)
                                })
                                .indicator(.activity)
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 5)
                                .padding()
                            Spacer()
                        }
                        HStack{
                            Image(systemName: "person.circle")
                            Text(user.name ?? "")
                        }
                        HStack{
                            Image(systemName: "envelope")
                            Text(user.email ?? "")
                        }
                        HStack{
                            Image(systemName: "phone")
                            Text(user.countryCode ?? "")
                            Text(user.mobile ?? "")
                        }
                        HStack{
                            Image(systemName: "person.circle.fill")
                            Text(user.gender ?? "")
                        }
                        HStack{
                            Image(systemName: "calendar")
                            Text(DateFormatter.longDateFormatter.string(from: user.dob ?? Date()))
                        }
                    }
                } else {
                    
                }
            }
            .navigationBarTitle("PROFILE", displayMode: .inline)
            .toolbar {
                NavigationLink(destination: EditProfileView(viewModel: EditProfileViewModel(iSessionManager: self.sessionManager, iUserData: self.viewModel.user))) {
                    Image(systemName: "square.and.pencil.circle")
                }
                Button(action: {
                    self.shouldShowLogOutOptions = true
                }, label: {
                    Image(systemName: "iphone.and.arrow.forward")
                })
            }.tint(.gray)
        }
        .onAppear(perform: {
            viewModel.fetchUser()
        })
        .alert(isPresented: $shouldShowLogOutOptions) {
            Alert(title: Text("Are you sure you want to logout?"), primaryButton: .destructive(Text("OK"), action: {
                SessionManager.shared.logout()
            }), secondaryButton: .cancel(Text("Cancel"), action: {
                self.shouldShowLogOutOptions = false
            }))
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
