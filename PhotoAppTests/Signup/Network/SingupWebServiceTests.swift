//
//  SingupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by ChaoBo-Shang on 2022/12/2.
//

import XCTest
@testable import PhotoApp

class SingupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSingupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let sut = SignupWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")
        
        let signFormRequestModel = SignupFormRequestModel(firstName: "Sergy", lastName: "Kargopolov", email: "test@test.com", password: "12345678")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.singup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
