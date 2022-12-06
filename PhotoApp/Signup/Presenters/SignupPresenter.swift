//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/4.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: .invalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: .invalidLastName)
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            delegate?.errorHandler(error: .invalidEmail)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password){
            delegate?.errorHandler(error: .invalidPassword)
            return
        }
        
        if !formModelValidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.password) {
            delegate?.errorHandler(error: .passwordsDoNotMatch)
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webservice.singup(withForm: requestModel) { [weak self] responseModel, error in
            // TODO: delegate
            
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self?.delegate?.successfullSignup()
                return
            }
        }
    }
}
