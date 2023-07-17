//
//  UsersListView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 08/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UsersListView: View {
    var usersData : UsersData
    
    var body: some View {
        HStack(alignment: .center) {
            HStack{
                let imgUrl = URL(string: usersData.image)
                WebImage(url: imgUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .cornerRadius(40)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 2)
                    .padding(.trailing, 10)
                VStack(alignment: .leading, spacing: 05, content: {
                    Text("\(usersData.firstName) \(usersData.lastName)").fontWeight(.semibold)
                    Text("\(usersData.email)").lineLimit(1)
                    Text("\(usersData.phone)")
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

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(usersData: UsersData(id: 0, firstName: "Frederique", lastName: "Boehm", maidenName: "Test", age: 20, gender: "Male", email: "mcrumpe1z@techcrunch.com", phone: "0987654321", username: "", password: "", birthDate: "", image: "https://robohash.org/doloremqueatqueet.png", bloodGroup: "", height: 0, weight: 0.0, eyeColor: "", hair: HairData(color: "", type: ""), domain: "", ip: "", address: AddressData(address: "", city: "", coordinates: CoordinatesData(lat: 0.0, lng: 0.0), postalCode: "", state: ""), macAddress: "", university: "", bank: BankData(cardExpire: "", cardNumber: "", cardType: "", currency: "", iban: "")))
    }
}
