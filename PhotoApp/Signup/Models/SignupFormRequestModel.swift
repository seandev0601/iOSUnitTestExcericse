//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/2.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
