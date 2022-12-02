//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/2.
//

import Foundation

class SignupWebService {
    
    private var urlSession: URLSession
    
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func singup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else { return // TODO: Create a unit test to test that a specific error message is returned is URL is nil}
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data,  response, error in
            // TODO: Write a new unit test to handle and error here
            
            if let data  = data, let signResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signResponseModel, nil)
            } else {
                // TODO: Create a new unit Test to handle an error here
                completionHandler(nil, nil)
            }
        }
        
        dataTask.resume()
        
        
    }
    
    
}
