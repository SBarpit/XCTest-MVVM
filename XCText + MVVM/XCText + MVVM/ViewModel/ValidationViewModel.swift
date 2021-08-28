//
//  ValidationViewModel.swift
//  XCText + MVVM
//
//  Created by Admin on 28/08/21.
//

import Foundation
enum ValidityExression : String {
    
    case userName = ##"^(?=.*[a-zA-Z])[a-zA-Z0-9!#$%^&*()_?\-\/+.]+$"##
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,}"
    case mobileNumber = "^[0-9]{6,20}$"
    case password = "^[a-zA-Z0-9!@#$%&*]{8,}"
    case name = "^[a-zA-Z]{2,15}"
    case webUrl = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
}

enum ValidationError: LocalizedError {
    case invalidValue
    case passwordTooLong
    case passwordTooShort
    case usernameTooLong
    case usernameTooShort
    case usernameInvalid
    case nameTooShort
    case nameTooLong
    case invalidEmail
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value."
        case .passwordTooLong:
            return "Your password is too long."
        case .passwordTooShort:
            return "Your password is too short."
        case .usernameTooLong:
            return "Your username is too long."
        case .usernameTooShort:
            return "Your username is too short."
        case .usernameInvalid:
            return "Enter a valid username."
        case .nameTooShort:
            return "Your Name is too short."
        case .nameTooLong:
            return "Your Name is too long."
        case .invalidEmail:
            return "Enter a valid email."
        }
    }
}


struct ValidationService {
    func validateFullName(_ name:String?) throws -> String{
        guard let name = name else { throw ValidationError.invalidValue }
        guard name.count > 3 else { throw ValidationError.nameTooShort }
        guard name.count < 20 else { throw ValidationError.nameTooLong }
        return name
    }
    
    func validateEmail(_ email:String?) throws -> String{
        guard let email = email else { throw ValidationError.invalidValue }
        guard checkIfValid(email, .email) else { throw ValidationError.invalidEmail }
        return email
    }
    
    func validateUsername(_ username: String?) throws -> String {
        guard let username = username else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        guard checkIfValid(username, .userName) else { throw ValidationError.usernameInvalid }
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        return password
    }
    
    func checkIfValid(_ value:String, _ validityExression : ValidityExression) -> Bool {
        let regEx = validityExression.rawValue
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return test.evaluate(with: value)
    }
    
    func checkIfInvalid(_ value:String,_ validityExression : ValidityExression) -> Bool {
        return !checkIfValid(value,validityExression)
    }
}
