//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/4.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
