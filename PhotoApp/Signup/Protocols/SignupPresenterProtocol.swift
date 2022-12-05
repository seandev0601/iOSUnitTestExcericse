//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/5.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
