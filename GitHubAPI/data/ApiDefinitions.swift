//
//  ApiDefinitions.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import Foundation

struct ApiDefinitions {
    
    // MARK: - The BASE URL
    
    enum Base: String {
        case home = "https://api.github.com/users/"
    }
    
    // MARK: - Possible Endpoints
    
    enum Endpoint: String {
        case repos = "/repos"
    }
    
    // MARK: - Possible Http Methods
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
}
