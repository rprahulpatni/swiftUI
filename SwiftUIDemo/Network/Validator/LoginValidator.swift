//
//  LoginValidator.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 10/07/23.
//

import Foundation
enum LoginValidator {
    case success
    case failure(LoginValidationType, String)
}
enum LoginValidationType{
    case userEmail
    case userPassword
}
