//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by ChaoBo-Shang on 2022/12/4.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expection: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    
    var signupError: SignupError?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expection?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        errorHandlerCounter += 1
        signupError = error
        expection?.fulfill()
    }
}
