//
//  MockSignupPressenter.swift
//  PhotoAppTests
//
//  Created by ChaoBo-Shang on 2022/12/5.
//

import Foundation
@testable import PhotoApp

class MockSignupPressenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
