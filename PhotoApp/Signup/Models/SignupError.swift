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
    case illigalCharactersFound
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case passwordsDoNotMatch
    
    var errorDescription: String? {
        switch self {
            case .failedRequest(let description):
            return description
        case .invalidResponseModel,
             .invalidRequestURLString,
             .illigalCharactersFound,
             .invalidFirstName,
             .invalidLastName,
             .invalidEmail,
             .invalidPassword,
             .passwordsDoNotMatch:
            return ""
        }
    }
}
