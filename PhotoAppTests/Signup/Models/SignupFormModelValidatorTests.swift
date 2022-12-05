//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by ChaoBo-Shang on 2022/12/1.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        // Arrange
        sut = SignupFormModelValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - First Name Validation Unit Tests Provided\TooShort\TooLong
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergey")
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE ")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SergeySergey")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE ")
        
    }
    
    func testSignupFormModelValidator_WhenInValidFirstNameContainsIlligalCharactersProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergey*")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have return False if user's first name contains illigal characters but it has returned TRUE")
    }
    
    // MARK: - Last Name Validation Unit Tests Provided\TooShort\TooLong
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
    
        let isLastNameValid = sut.isLastNameValid(lastName: "Beyounbo")
        
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "B")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }

    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "BeyounboBeyounbo")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: - Email Address Fromat Unit Tests ValidEmail\InValidEmail
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        let isValidEmailFormat = sut.isValidEmailFormat(email: "a123@gmail.com")
        
        XCTAssertTrue(isValidEmailFormat, "The isValidEmailFormat() should have returned TRUE for a valid email address Format but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        
        let isValidEmailFormat = sut.isValidEmailFormat(email: "a123.gmail.com")
        
        XCTAssertFalse(isValidEmailFormat, "The isValidEmailFormat() should have returned FALSE for a valid email email address Format but returned TRUE")
    }
    
    // MARK: - Password Validation Unit Tests Provided\TooShort\TooLong
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        let isPasswordValid = sut.isPasswordValid(password: "abcdefgh")
        
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        let isPasswordValid = sut.isPasswordValid(password: "abcd")
        
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters but it has returned TRUE")
    }

    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        let isPasswordValid = sut.isPasswordValid(password: "abcdefghabcdefghabcdefgh")
        
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: - Match Password Validation Unit Tests Equal\NotMatch
    func testSignupFormModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        
        let doPasswordMatch = sut.doPasswordMatch(password: "abcd1234", repeatPassword: "abcd1234")
        
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchPasswordProvided_ShouldReturnFalse() {
        
        let doPasswordMatch = sut.doPasswordMatch(password: "abcd1234", repeatPassword: "efgh1234")
        
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have returned FALSE for password that do not match but it has returned TRUE")
    }
}
