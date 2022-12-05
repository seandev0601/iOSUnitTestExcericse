//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/1.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        let invalidCharacters = CharacterSet(charactersIn: "{}$#%*&^.,/?!@")
        
        // Check for illigal characters
        if firstName.rangeOfCharacter(from: invalidCharacters) != nil {
            returnValue = false
        }
        
        if firstName.isEmpty || firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.isEmpty ||
            lastName.count < SignupConstants.lastNameMinLength ||
            lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.isEmpty ||
            password.count < SignupConstants.passwordMinLength ||
            password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
