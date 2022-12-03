//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by ChaoBo-Shang on 2022/12/2.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
            case .failedRequest(let description):
            return description
            case .invalidResponseModel, .invalidRequestURLString:
                return ""
        }
    }
}
