//
//  UserViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 13/07/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import UIKit

class UserViewModel: ObservableObject {
    @Published var user: AuthUserData?
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userRef = Firestore.firestore().collection("users").document(uid)
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let user = AuthUserData(document: document) {
                    self.user = user
                }
            } else {
                print("Document does not exist or there was an error: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
