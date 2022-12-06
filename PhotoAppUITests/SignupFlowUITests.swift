//
//  SignupFlowUITests.swift
//  SignupFlowUITests
//
//  Created by ChaoBo-Shang on 2022/11/30.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    var app: XCUIApplication!
    var firstName: XCUIElement!
    var lastName: XCUIElement!
    var email: XCUIElement!
    var password: XCUIElement!
    var repeatPassword: XCUIElement!
    var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup Button is not enabled for user interactions")
    }
    
    func testSignupViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        
        // Arrange
        firstName.tap()
        firstName.typeText("Sergey")
        
        lastName.tap()
        lastName.typeText("Kargopolov")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 3), "An Success Dialog was not presented when valid signup form was submitted")
    }
    
    func testSignupViewController_WheninvalidFormSubmitted_PresentsErrorAlertDialog() {
        
        // Arrange
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("K")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        let emailTextFieldScreenshot = email.screenshot()
        let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
        emailTextFieldAttachment.name = "Screenshot of Email UITextField"
        emailTextFieldAttachment.lifetime = .keepAlways
        add(emailTextFieldAttachment)
        
        let currentAppWindow = XCUIScreen.main.screenshot()
        let currentAppAttachment = XCTAttachment(screenshot: currentAppWindow)
        currentAppAttachment.name = "Signup page Screenshot"
        currentAppAttachment.lifetime = .keepAlways
        add(currentAppAttachment)
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Dialog was not presented when invalid signup form was submitted")
    }
    
    func testSignupViewController_WhenSuccessAlertTapped_PresentsHomePageViewController() {
        
        // Arrange
        firstName.tap()
        firstName.typeText("Sergey")
        
        lastName.tap()
        lastName.typeText("Kargopolov")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        let successAlert = self.app.alerts["successAlertDialog"]
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: successAlert, handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
        
        if successAlert.exists {
            let okButton = successAlert.buttons["Ok"]
            okButton.tap()
            
            // Assert
            XCTAssertTrue(self.app.otherElements["HomePageViewController"].waitForExistence(timeout: 1), "The SignupViewController was not presented when the success alert was tapped")
        }
    }
}
