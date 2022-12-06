//
//  LoginViewControllerTests.swift
//  PhotoAppTests
//
//  Created by ChaoBo-Shang on 2022/12/5.
//

import XCTest
@testable import PhotoApp

class LoginViewControllerTests: XCTestCase {
    
    var sut: LoginViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //Loading LoginViewController that use xib or programmatically
        sut = LoginViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testLoginViewController_WhenCreated_ShouldReturnTrue() {
        XCTAssertNotNil(sut, "")
    }

}
