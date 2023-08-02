//
//  UsersView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 17/07/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UsersView: View {
    var usersData : AuthUserData
    
    var body: some View {
        HStack(alignment: .center) {
            HStack{
                let imgUrl = URL(string: usersData.profilePic ?? "")
                WebImage(url: imgUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .cornerRadius(40)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 2)
                    .padding(.trailing, 10)
                VStack(alignment: .leading, spacing: 05, content: {
                    Text("\(usersData.name ?? "")").fontWeight(.semibold)
                    Text("\(usersData.email ?? "")").lineLimit(1)
                    Text("\(usersData.countryCode ?? "")\(usersData.mobile ?? "")")
                }).foregroundColor(.black)
            }.padding(.all, 15)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(usersData: AuthUserData(profilePic: "", name:  "Rahul", email: "rp@mailinator.com", dob: "", gender: "", countryCode: "+91", mobile: "9999889988", userId: ""))
    }
}
