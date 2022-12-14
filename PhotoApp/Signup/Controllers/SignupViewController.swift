//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/5.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        #if DEBUG
//        if CommandLine.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
//
//        #if DEBUG
//        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif

        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            
            let signupUrl = ProcessInfo.processInfo.environment["signupUrl"] ?? SignupConstants.signupURLString
            
            let webservice = SignupWebService(urlString: signupUrl)
            
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: webservice, delegate: self)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
    func presentHomePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageViewController = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        homePageViewController.view.accessibilityIdentifier = "HomePageViewController"
        self.present(homePageViewController, animated: true, completion: nil)
    }

}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignup() {
        let alert = UIAlertController(title: "Success", message: "The signup operation was successful", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
            self.presentHomePage()
        }))
        
        DispatchQueue.main.sync {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "signupFormErrorAlertTitle".localized, message: "signupFormErrorAlertBodyMessage".localized, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "signupFormErrorAlertOkButtonTitle".localized, style: .default, handler: nil))
        
//        DispatchQueue.main.sync {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
//        }
    }
}
