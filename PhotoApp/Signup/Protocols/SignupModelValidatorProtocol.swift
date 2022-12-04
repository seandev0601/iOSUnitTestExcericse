//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/4.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isValidEmailFormat(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}
