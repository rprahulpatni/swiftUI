//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import UIKit

class ListViewModel: ObservableObject {
    private let resources: ProductsResources = ProductsResources()
    @Published var arrProducts : Array<ProductsModel> = Array<ProductsModel>()
    @Published var arrUsers : Array<AuthUserData> = Array<AuthUserData>()
    @Published var isLoading = false

//    func getProductsList() {
//        resources.getProductList() { result in
//            switch result {
//            case .success(let products):
//                DispatchQueue.main.async {
//                    self.arrProducts.append(contentsOf: products)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//                // inform about the error
//            }
//        }
//    }
    
    func fetchUsersList() {
        self.isLoading = true
        self.arrUsers.removeAll()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let usersRef = Database.database().reference().child("users")
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            guard let usersData = snapshot.value as? [String: Any] else {
                print("No users found")
                self.isLoading = false
                return
            }
            for (userId, userData) in usersData {
                if let userInfo = userData as? [String: Any] {
                    // Access user information here
                    if uid != userId {
                        let usersData = AuthUserData(profilePic: userInfo["profilePic"] as? String ?? "", name:  userInfo["name"] as? String ?? "", email:  userInfo["email"] as? String ?? "", dob:  userInfo["dob"] as? String ?? "", gender:  userInfo["gender"] as? String ?? "", countryCode:  userInfo["countryCode"] as? String ?? "", mobile:  userInfo["mobile"] as? String ?? "", userId: userInfo["userId"] as? String ?? "")
                        self.arrUsers.append(usersData)
                    }
                }
            }
            self.isLoading = false
        })
    }
}
