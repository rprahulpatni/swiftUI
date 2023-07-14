//
//  HomeViewDetails.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 08/06/23.
//

import SwiftUI
import CoreLocation
import SDWebImageSwiftUI

struct HomeViewDetails: View {
    var userData: UsersData
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    let coordinates = CLLocationCoordinate2D(latitude: userData.address.coordinates.lat, longitude: userData.address.coordinates.lng)
                    CustomMapView(coordinate: coordinates)
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 200)

                    UsersListView(usersData: userData)
                        .offset(y: -50)
                        //.padding(.bottom, -130)
                }.toolbar(.hidden, for: .tabBar)
            }.navigationBarTitle(userData.firstName, displayMode: .inline)
                .navigationBarBackButtonHidden()
                .navigationBarItems(leading: CustomBackButton())
        }
    }
}

struct HomeViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDetails(userData: UsersData(id: 0, firstName: "Frederique", lastName: "Boehm", maidenName: "Test", age: 20, gender: "Male", email: "mcrumpe1z@techcrunch.com", phone: "0987654321", username: "", password: "", birthDate: "", image: "https://robohash.org/doloremqueatqueet.png", bloodGroup: "", height: 0, weight: 0.0, eyeColor: "", hair: HairData(color: "", type: ""), domain: "", ip: "", address: AddressData(address: "", city: "", coordinates: CoordinatesData(lat: 34.011_286, lng: -116.166_868), postalCode: "", state: ""), macAddress: "", university: "", bank: BankData(cardExpire: "", cardNumber: "", cardType: "", currency: "", iban: "")))
    }
}
