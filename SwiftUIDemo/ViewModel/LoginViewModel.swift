//
//  LoginViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 10/07/23.
//

import Foundation
import Firebase

protocol iLoginViewModel {
    func validateUser(userEmail:String, password:String)-> LoginValidator
}

class LoginViewModel: iLoginViewModel, ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    @Published var showAlert = false
    @Published var isLoading: Bool = false
    let sessionManager: SessionManager?
    var loggedInUser : User?

    init(iSessionManager: SessionManager?) {
        self.sessionManager = iSessionManager
    }
    
    func validateUser(userEmail: String, password: String) -> LoginValidator {
        guard userEmail.isNotEmpty else {
            return .failure(.userEmail, StringConstants.LoginSignUp.userEmailBlank)
        }
        guard userEmail.isValidEmail else {
            return .failure(.userEmail, StringConstants.LoginSignUp.userEmailValid)
        }
        guard password.isNotEmpty else {
            return .failure(.userPassword, StringConstants.LoginSignUp.passwordBlank)
        }
        return .success
    }
    
    func login() {
        self.isLoading = true
        let response = self.validateUser(userEmail: self.email, password: self.password)
        switch response {
        case .success:
            sessionManager?.action_Login(self.email, self.password) { [weak self] (success, error, result) in
                guard let self = self else { return }
                let err = error
                if err.isNotEmpty {
                    self.errorMessage = err
                    self.showAlert = true
                    self.isLoading = false
                } else {
                    self.loggedInUser = result
                    self.showAlert = true
                    self.isLoggedIn = true
                    self.isLoading = false
                }
            }
            
        case .failure(let type, let msg):
            print(type, msg)
            self.errorMessage = msg
            self.showAlert = true
            self.isLoading = false
        }
    }
}
