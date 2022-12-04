//
//  SignupFormModel.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/4.
//

import Foundation

struct SignupFormModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let repeatPassword: String
    
}
