//
//  ListViewDetails.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 17/07/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListViewDetails: View {
    var userData: AuthUserData?
    
    var body: some View {
        //        NavigationStack {
        VStack {
            CustomUserForm(user: userData)
        }.toolbar(.hidden, for: .tabBar)
            .navigationBarTitle(userData?.name ?? "", displayMode: .inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButton())
        //        }
    }
}

struct ListViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        ListViewDetails(userData: AuthUserData(profilePic: "", name:  "", email: "", dob: "", gender: "", countryCode: "", mobile: "", userId: ""))
    }
}
