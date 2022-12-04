//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/4.
//

import Foundation

protocol SignupWebServiceProtocol {
    func singup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
