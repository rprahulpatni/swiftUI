//
//  SignUpValidator.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 10/07/23.
//

import Foundation

enum SignUpValidator {
    case success
    case failure(SignUpValidationType, String)
}
enum SignUpValidationType{
    case userName
    case userEmail
    case userCountryCode
    case userMobile
    case userPassword
    case userConfirmPassword
}

enum EditProfileValidator {
    case success
    case failure(EditProfileValidationType, String)
}
enum EditProfileValidationType{
    case userName
    case userEmail
    case userCountryCode
    case userMobile
}
