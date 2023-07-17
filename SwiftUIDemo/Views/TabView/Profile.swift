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
            VStack{
                CustomUserForm(user: self.viewModel.user)
            }.navigationBarTitle("PROFILE", displayMode: .inline)
                .toolbar {
                    NavigationLink(destination: EditProfileView(viewModel: EditProfileViewModel(iSessionManager: self.sessionManager, iUserData: self.viewModel.user))) {
                        Image(systemName: "square.and.pencil.circle")
                    }
                    Button(action: {
                        self.shouldShowLogOutOptions = true
                    }, label: {
                        Image(systemName: "iphone.and.arrow.forward")
                    })
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
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
