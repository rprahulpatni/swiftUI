//
//  StringConstants.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 10/07/23.
//

import Foundation
import UIKit

struct StringConstants {
    static let msgError = "Error"
    static let msgCancel = "Cancel"
    struct APIErrors {
        static let noNetwork = "Please check your internet connection and try again"
        static let errorOccured = "Error occured while processing your request"
    }
    
    struct LoginSignUp {
        static let userEmailBlank = "Email cannot be blank"
        static let userEmailValid = "Please enter valid email"
        static let userNameBlank = "Username cannot be blank"
        static let userCountryCodeBlank = "Country Code cannot be blank"
        static let userMobileBlank = "Mobile number cannot be blank"
        static let userMobileValid = "Please enter valid mobile number"
        static let userDOBBlank = "Date of Birth cannot be blank"
        static let passwordBlank = "Password cannot be blank"
        static let confirmPasswordBlank = "Confirm Password cannot be blank"
        static let confirmPasswordMatch = "Password and Confirm Password does not matched"
        static let error = "Login Failed, the username or password provided in the request is invalid"
    }
}

extension String {
    var isNotEmpty: Bool {
        return !self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).isEmpty
    }
    
    var isValidEmail: Bool {
        let emailRegex:NSString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest:NSPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let pwdRegex: NSString = "(?=^.{6,14}$)(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?\\&gt;.&lt;,])(?!.*\\s).*$"
        let pwdTest:NSPredicate = NSPredicate(format:"SELF MATCHES %@", pwdRegex)
        return pwdTest.evaluate(with: self)
    }
    
    var isValidName: Bool {
        let regX: NSString = "^([a-zA-Z]+s?)( [a-zA-Z]+s?)*$"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", regX)
        let result =  nameTest.evaluate(with: self)
        return result
    }
    
    var isValidMobile: Bool {
        let regX: NSString = "^[6-9]\\d{9}$"//"^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", regX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
}

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

extension DateFormatter {
    static var longDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    static var stringToDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }
}

