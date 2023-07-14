//
//  SignUpViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 10/07/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import UIKit

protocol iSignUpViewModel {
    func validateUser(userName: String, userEmail: String, userCountryCode: String, userMobile: String, userDOB: Date, password: String, confirmPassword: String)-> SignUpValidator
}

class SignUpViewModel: iSignUpViewModel, ObservableObject {
    @Published var userProfilePic = ""
    @Published var userName = ""
    @Published var userEmail = ""
    @Published var userCountryCode = ""
    @Published var userMobile = ""
    @Published var userGender = ""
    @Published var userDOB = Date.now
    @Published var userPassword = ""
    @Published var userConfirmPassword = ""
    @Published var selectedImage : UIImage? = nil
    
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var isLoggedIn = false
    
    let sessionManager: SessionManager?
    var loggedInUser : User?
    
    init(iSessionManager: SessionManager?) {
        self.sessionManager = iSessionManager
    }
    
    func validateUser(userName: String, userEmail: String, userCountryCode: String, userMobile: String, userDOB: Date, password: String, confirmPassword: String) -> SignUpValidator {
        guard userName.isNotEmpty else {
            return .failure(.userName, StringConstants.LoginSignUp.userNameBlank)
        }
        guard userEmail.isNotEmpty else {
            return .failure(.userEmail, StringConstants.LoginSignUp.userEmailBlank)
        }
        guard userEmail.isValidEmail else {
            return .failure(.userEmail, StringConstants.LoginSignUp.userEmailValid)
        }
        guard userCountryCode.isNotEmpty else {
            return .failure(.userCountryCode, StringConstants.LoginSignUp.userCountryCodeBlank)
        }
        guard userMobile.isNotEmpty else {
            return .failure(.userMobile, StringConstants.LoginSignUp.userMobileBlank)
        }
        guard userMobile.isValidMobile else {
            return .failure(.userEmail, StringConstants.LoginSignUp.userMobileValid)
        }
        let dob = DateFormatter.longDateFormatter.string(from: userDOB)
        guard dob.isNotEmpty else {
            return .failure(.userMobile, StringConstants.LoginSignUp.userDOBBlank)
        }
        guard password.isNotEmpty else {
            return .failure(.userPassword, StringConstants.LoginSignUp.passwordBlank)
        }
        guard confirmPassword.isNotEmpty else {
            return .failure(.userConfirmPassword, StringConstants.LoginSignUp.confirmPasswordBlank)
        }
        guard password == confirmPassword else {
            return .failure(.userConfirmPassword, StringConstants.LoginSignUp.confirmPasswordMatch)
        }
        return .success
    }
    
    func signUp() {
        let response = self.validateUser(userName: self.userName, userEmail: self.userEmail, userCountryCode: self.userCountryCode, userMobile: self.userMobile, userDOB: self.userDOB, password: self.userPassword, confirmPassword: self.userConfirmPassword)
        switch response {
        case .success:
            sessionManager?.action_Signup(self.userEmail, self.userPassword) { [weak self] (success, error, result) in
                guard let self = self else { return }
                let err = error
                if err.isNotEmpty {
                    self.errorMessage = err
                    self.showAlert = true
                } else {
                    self.loggedInUser = result
                    self.showAlert = false
                    self.uploadUserProfile()
                }
            }
        case .failure(let type, let msg):
            print(type, msg)
            self.showAlert = true
            self.errorMessage = msg
        }
    }
    
    func uploadUserProfile() {
        self.sessionManager?.uploadImageToFirebaseStorage(image: self.selectedImage) { imageUrl, failure in
            if failure.isNotEmpty {
                self.errorMessage = failure
                self.showAlert = true
            } else {
                self.userProfilePic = imageUrl
                let updatedData: [String: Any] = [
                    "profilePic": self.userProfilePic,
                    "name": self.userName,
                    "email": self.userEmail,
                    "dob": self.userDOB,
                    "gender": self.userGender,
                    "countryCode": self.userCountryCode,
                    "mobile": self.userMobile
                ]
                
                // Call the function to update user information
                self.sessionManager?.addUserInformation(userData: updatedData) { success, error in
                    let err = failure
                    if err.isNotEmpty {
                        self.errorMessage = err
                        self.showAlert = true
                    } else {
                        self.isLoggedIn = true
                        self.showAlert = true
                    }
                }
            }
        }
    }
}

//extension SignUpViewModel {
//    func addUserInformation(completion: @escaping (Bool, String) -> Void) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let userRef = Firestore.firestore().collection("users").document(uid)
//        let updatedData: [String: Any] = [
//            "profilePic": self.userProfilePic,
//            "name": self.userName,
//            "email": self.userEmail,
//            "dob": self.userDOB,
//            "gender": self.userGender,
//            "countryCode": self.userCountryCode,
//            "mobile": self.userMobile
//        ]
//        // Update the user document in Firestore with the additional information
//        userRef.setData(updatedData) { error in
//            if let err = error {
//                completion(false, err.localizedDescription)
//            } else {
//                completion(true, "")
//            }
//        }
//    }
//}

///////
///


