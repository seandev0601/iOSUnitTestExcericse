//
//  SingupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by ChaoBo-Shang on 2022/12/2.
//

import XCTest
@testable import PhotoApp

class SingupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        signFormRequestModel = SignupFormRequestModel(firstName: "Sergy", lastName: "Kargopolov", email: "test@test.com", password: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSingupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
//        let jsonString = "{\"status\":\"error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.singup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        // Arrange
        let jsonString = "{\"path\":\"user\", \"error\":\"Internal ServerError\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.singup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        
        sut = SignupWebService(urlString: "")
        
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        // Act
        sut.singup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error fo an invalidRequestURLString error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebservice_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
//        MockURLProtocol.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        let expectation = self.expectation(description: "A failed Request expectation")
        
        // Act
        sut.singup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
//            XCTAssertEqual(error?.localizedDescription, errorDescription)
//            print("Accept: \(error?.errorDescription)")
//            print("Result: \(SignupError.failedRequest(description: errorDescription).errorDescription)")
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription), "The signup() method did not return an expect error for Failed Request")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
        
    }
}
